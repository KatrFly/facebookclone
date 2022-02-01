class UserMailer < ApplicationMailer
  def welcome_mail
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to my Facebookclone!")
  end

  def new_post
    @post = params[:post]
    @user = params[:user]
    mail(to: @user.email, subject: "Congrats on the new post!")
  end
end
