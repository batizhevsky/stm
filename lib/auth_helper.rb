module AuthHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    current_user || false
  end

  def sign_out
    @current_user = session[:user_id] = nil
  end

  def sign_in user
    session[:user_id] = user.id
  end

  def auth!
    redirect_to new_session_url unless signed_in?
  end

end
