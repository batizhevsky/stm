module AuthHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    current_user.present?
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

  def api_auth!
    authenticate_or_request_with_http_basic do |user, password|
      user = UserType.find_by_name(user).try(:authenticate, password)
      sign_in user
    end
  end

end
