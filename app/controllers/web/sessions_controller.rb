class Web::SessionsController < Web::ApplicationController

  def new
   @session = UserSigninType.new
  end

  def create
    @user = UserSigninType.try_sign(params[:user])

    if @user
      sign_in @user
      flash_success
      redirect_to root_path
    else
      @session = UserSigninType.new(params[:user])
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
