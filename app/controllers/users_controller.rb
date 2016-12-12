class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Sign Up Successfull."
    else
      flash[:error] = "Sign Up Unsuccessfull"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])

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
