class UsersController < ApplicationController

  def show
    @user = authorize User.find(params[:id])
    @items = Item.where(user: @user)
  end

end
