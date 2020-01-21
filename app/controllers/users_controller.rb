class UsersController < ApplicationController

  def show
    @user = authorize User.find(params[:id])
  end

end
