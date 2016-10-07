class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    item = current_user.items.new(item_params)
    
    if item.save
      flash[:notice] = "That item was added to your list successfully!"
      redirect_to [current_user]
    else
      flash[:alert] = "That item didn't save properly! Try again!"
    end
  end
  
  def item_params
    params.required(:item).permit(:name)
  end
end
