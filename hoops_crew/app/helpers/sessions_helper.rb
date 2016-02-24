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
      redirect_to "/"
    end
  end

  # def logout
  #   @current_user = session[:user_id] = nil
  # end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authorize?
    return current_user == User.find(params[:user_id])
  end
end
