class PostMailer < ApplicationMailer
  def new_post
    @post = params[:post]
    @user = params[:user]
    mail(to: @user.email, subject: "Congrats on the new post!")
  end
end
