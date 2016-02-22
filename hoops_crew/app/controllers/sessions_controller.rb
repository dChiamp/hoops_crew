class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(login_params)
    if @user 
      login(@user)
      redirect_to "/users/#{@user.id}"
    else 
      redirect_to sign_up
    end
  end

  private 
  def login_params
    params.require(:user).permit(:name, :email, :password)
  end
end
