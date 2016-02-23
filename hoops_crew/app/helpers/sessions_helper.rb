module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def logged_in?
    if current_user == nil
      redirect_to new_user
    end
  end

  # def logout
  #   @current_user = session[:user_id] = nil
  # end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authorize
    if @current_user == User.find(params[:id])
      @right_person = true
    end
  end
end
