class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(login_params)
    if @user 
      login(@user)
      flash.alert = "logged in!"
      redirect_to @user
    else 
      flash[:notice] = "somethings wrong, create an account"
      render :new
    end
  end

  def destroy
    log_out
    flash[:notice] = "You have successfully logged out."
    redirect_to "/"
  end

  private 
  def login_params
    params.require(:user).permit(:name, :email, :password)
  end
end
