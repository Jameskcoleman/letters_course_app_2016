class AppMailer < ActionMailer::Base
  def send_welcome_email(user)
    @user = user
    mail to: user.email, from: "info@letterscourse.com", subject: "Welcome to the Letters Course!"
  end

  def send_forgot_password(user)
    @user = user
    mail(to: @user.email, from: "info@letterscourse.com", subject: "Please reset your password.")
  end

end