class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :update]

  def show
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user.update(user_params)
    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :city, :email, :password, :facebook,
                                 :twitter)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
