class ApplicationController < ActionController::Base

  before_action :fetch_user

  private

  def check_if_logged_in
    unless @current_user.present?
      flash[:error] = "You must be logged in to view that page."
      redirect_to login_path
    end
  end

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user.present?
    end
  end
end
