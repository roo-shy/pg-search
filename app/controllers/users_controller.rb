class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:email, :password)
    @user.confirm_token = SecureRandom.hex
    if @user.save
      # Send a confirmation link to the user
      UserMailer.confirmation(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
   end

  def verify
    @user = User.find_by confirm_token: params[:confirm_token]
    if @user.present?
      @user.update confirmed: true, confirm_token: nil
      redirect_to root_path
    else
      render :confirm_pending
    end
  end

  def confirm_pending
  end
end
