class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      redirect_to user_path
    else
      render "edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :name, :password, :avatar, :self_introduce, :icon_image)
  end

end
