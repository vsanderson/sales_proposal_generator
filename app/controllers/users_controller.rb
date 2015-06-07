class UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy, :update_password]
  before_action :require_user, only: [:edit, :password]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(resource_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "#{@user.first_name}, your account has been created and you are now logged in!"
      redirect_to root_path
    else
      flash[:error] = 'Unable to create user. Please try again!'
      render :new
    end
  end

  def password
  end

  def update
    if @user.update(resource_params)
      redirect_to user_path(@user)
    else
      render params[:commit] == 'Update Password' ? :password : :new
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Blorg was successfully destroyed.'
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def resource_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
