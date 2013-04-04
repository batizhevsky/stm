class Web::SessionsController < Web::ApplicationController

  def new
   @session = UserSigninType.new 
  end

  def create
    user_form = params[:user]
    user = UserSigninType.try_sign(user_form)
    if user
      sign_in user
      flash_success
      redirect_to root_path
    else
      flash_error
      redirect_to new_session_url 
    end
  end

  def destroy
    sign_out
    flash_success
    redirect_to root_url
  end
end
