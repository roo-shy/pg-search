class SessionsController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    @user = User.find_by email: email
    if @user && @user.authentication(password)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path
  end
end
