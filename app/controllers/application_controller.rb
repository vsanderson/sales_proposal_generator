class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user, :user_logged_in?

  private

  def current_user
    @current_user ||= begin
      session[:user_id] ? User.find(session[:user_id]) : GuestUser.new
    end
  end

  def user_logged_in?
    current_user.persisted?
  end

  def require_user
    if user_logged_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

end
