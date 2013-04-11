class Web::UsersController < Web::ApplicationController
  before_filter :auth!, except: [:show, :new, :create]

  def show
    @user = UserType.find(params[:id])
  end

  def new
    @user = UserType.new
  end

  def create
    @user = UserType.new(params[:user])
    if @user.save
      sign_in @user
      flash_success
      redirect_to user_path(@user)
    else
      flash_error
      render :new
    end
  end

  def destroy
    @user = UserType.find(params[:id])
    @user.deactivate!
    redirect_to root_url
  end

  def update
    @user = UserType.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to user_url(@user.id)
  end
end
