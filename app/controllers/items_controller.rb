class ItemsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: [:new, :cancel]
  
  
  def new
    @item = Item.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
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
  
  def cancel
    respond_to do |format|
     format.js
    end
  end
  
  
  
  private
  
  def item_params
    params.required(:item).permit(:name)
  end
end
