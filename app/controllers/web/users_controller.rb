class Web::UsersController < Web::ApplicationController
  def show
    user_id = params[:id]
    @user = UserType.find(user_id)
  end

  def new
    @user = UserType.new
  end

  def create
    form_params = params[:user]
    @user = UserType.new(form_params)
    if @user.save 
      flash_success
      redirect_to user_path(@user)
    else
      flash_error
      render :new
    end
  end

  def destroy 
    user_id = params[:id]
    user = UserType.find user_id
    user.delete 
    redirect_to root_url
  end
end
