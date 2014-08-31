class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @debates = Debate.where(author: @user)
    @comments = Comment.where(user: @user)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_url, notice: 'New user created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
