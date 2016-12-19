class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, flash: { error: "Incorrect email or password"}
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
