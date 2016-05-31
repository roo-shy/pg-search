class UserMailer < ApplicationMailer

  def confirmation(user)
    @user = user
    mail_to: user.email, subject: "Please confirm your email"
end
