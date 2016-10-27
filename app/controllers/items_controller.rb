class ItemsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: [:new, :cancel]
  
  def create
    @user = current_user
    @item = @user.items.new(item_params)

    
    if @item.save
      return
    else
      flash[:alert] = "That item didn't save properly! Try again!"
    end
    
    respond_to do |format|
     format.html
     format.js
    end
  end
  
  def complete
    @item = Item.find(params[:id])
    
    @item.update_attribute(:completed, true)
    
    respond_to do |format|
     format.js
    end  
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash.now[:notice] = "That item has been successfully deleted!"
    else
      flash.now[:alert] = "Something went wrong when deleting that item!"
    end
    
    respond_to do |format|
     format.js
    end    
  end
  
  
  
  private
  
  def item_params
    params.required(:item).permit(:name)
  end
end
