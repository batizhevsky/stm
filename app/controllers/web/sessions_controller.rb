class Web::SessionsController < Web::ApplicationController

  def new
   @user = UserSigninType.new
  end

  def create
    @user = UserSigninType.new(params[:user])

    if @user.try_sign
      sign_in @user

      flash_success
      redirect_to root_path
    else
      flash_error
      render :new
    end
  end

  def destroy
    sign_out

    flash_success
    redirect_to root_url
  end
end
