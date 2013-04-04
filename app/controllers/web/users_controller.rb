class Web::UsersController < Web::ApplicationController
  def show
    @user = UserType.find(params[:id])
  end

  def new
    @user = UserType.new
  end

  def create
    @user = UserType.new(params[:user])
    if @user.save
      flash_success
      redirect_to user_path(@user)
    else
      flash_error
      render :new
    end
  end

  def destroy 
    @user = UserType.find(params[:id])
    @user.deactivate
    redirect_to root_url
  end
end
