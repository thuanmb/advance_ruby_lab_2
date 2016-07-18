class SessionsController < ApplicationController
  def new
    build_sign_in({})
  end

  def create
    byebug
    build_sign_in(build_user_info)
    if @sign_in.valid?
      session[:user_id] = @sign_in.user_id
      redirect_to users_path, notice: "Signed in."
    else
      render 'new'
    end
  end

  private

  def build_sign_in(user_info)
    @sign_in = SignIn.new(user_info)
  end

  def build_user_info
    params.require(:sign_in).permit(:email, :password)
  end
end
