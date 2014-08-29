class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:session][:username])
    user.authenticate(params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid username/password"
      render 'new'
    else
      session[:user_id] = user.id
      redirect_to users_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to debates_path
  end
end
