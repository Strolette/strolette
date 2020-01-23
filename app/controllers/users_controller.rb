class UsersController < ApplicationController

  def show
    @user = authorize User.find(params[:id])
    @items = Item.where(user: @user)
  end

  def edit
    @user = authorize User.new
  end

  def update
    @user = authorize User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :email)
  end
# comment gerer lorsque l'image est vide --> erreur
end
