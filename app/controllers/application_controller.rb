class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  #before_action :authorize (para todos: skip_before_action :authenticate)
  #before_filter :authorize (individual)
  before_action :authorize

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def authorize
    redirect_to login_path unless current_user
  end
end
