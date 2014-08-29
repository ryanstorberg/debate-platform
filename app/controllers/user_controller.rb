class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user.new(user_params)
    @user.save
  end

  private
    def user_params
      params.require(:user).permit(:username, :email)

    end

end
