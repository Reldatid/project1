class SessionController < ApplicationController
  def new
    unless @current_user.nil?
      redirect_to user_path(@current_user)
    end
  end

  def create
    user = User.find_by email: params[:email]
    if user.present? && user.authenticate( params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Invalid email of password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
