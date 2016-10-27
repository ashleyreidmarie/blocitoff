class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @uncompleted_items = @user.items.uncompleted
    @complete_items = @user.items.completed
  end
end
