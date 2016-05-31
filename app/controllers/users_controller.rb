class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:email, :password)
  

  end

  def verify
  end

  def confirm_pending
  end
end
