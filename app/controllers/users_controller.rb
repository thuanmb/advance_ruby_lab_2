class UsersController < ApplicationController
  def new
    build_user({})
  end

  def create
    build_user(user_params)
    if @user.save
      redirect_to users_path, notice: "User created."
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def build_user(user_info)
    @user = User.new user_info
  end
end
