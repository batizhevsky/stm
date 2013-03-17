class Web::SessionsController < Web::ApplicationController

  def new
   @session = UserSigninType.new 
  end

  def create
    user_form = params[:user]
    user = UserSigninType.new user_form
    if user.try_sign
      sign_in user
      puts '+' * 10
      puts session

      puts signed_in? 
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
