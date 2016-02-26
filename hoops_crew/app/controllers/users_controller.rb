class UsersController < ApplicationController
  before_action :logged_in?, only: :index
  #show all users page (from nav)
  # def landing_page
  #   render "test"
  # end

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
    login(@user)

    # test mail
    ApplicationMailer.final_date_email(@user).deliver!

    # redirect_to "/users/#{@user.id}"
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
    render :show
  end

  def edit
    @user = User.find(params[:user_id])
    if authorize?
      # if @right_person
        render :edit
      else 
        redirect_to "/"
      end
    # render :edit
  end

  def update
    p "hey from update"
    @user = User.find(params[:user_id])
    # update the user
    @user.update_attributes(user_params)
    # redirect_to "/users/#{@user.id}"
    redirect_to user_path
  end

  def destroy
    log_out
    User.destroy(params[:user_id])
    redirect_to "/"
    flash[:notice] = "You have successfully logged out."
    # redirect_to landing_page
  end

  private
  def user_params
    params.require(:user).permit(:name, :origin, :pic, :neighborhood, :bio, :email, :password)
  end

end
