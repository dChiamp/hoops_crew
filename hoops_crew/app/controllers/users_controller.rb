class UsersController < ApplicationController
  #show all users page (from nav)
  def landing_page
    render "test"
  end

  def index
    @users = User.all
    render :index
  end


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    # login(@user)
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    # update the user
    @user.update_attributes(user_params)
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    User.destroy(params[:id])
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:name, :origin, :pic, :neighborhood, :bio, :email, :password)
  end

end
