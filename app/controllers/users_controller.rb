class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :avatar, :self_introduce)
  end
end
