class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]

    email_with_name = %("#{@user.name}" <#{@user.email}>)

    mail(to: email_with_name)
  end
end
