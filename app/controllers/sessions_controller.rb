class SessionsController < ApplicationController

  def new
    redirect_to root_path if user_logged_in?
  end

  def create
    user = User.find_by_email(resource_params[:email])
    if user && user.authenticate(resource_params[:password])
      session[:user_id] = user.id
      flash[:success] ='Logged in!'
      redirect_to root_path
    else
      flash[:error] = 'Unable to log in. Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, success: 'Logged out!'
  end

  protected

  def resource_params
    params.require(:session).permit(:email, :password)
  end

end
