class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver_now
      redirect_to user_path(@user), notice: "Sign Up Successfull."
    else
      flash[:error] = "Sign Up Unsuccessfull"
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
     @user = current_user

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  protected

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :country, :isreceivingmail)
    end

end
