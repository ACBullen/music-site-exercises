class UserMailer < ApplicationMailer
  default from: "bandscoolbands@music.com"
  def welcome_message(user)
    @user = user
    @url = "localhost:3000/activation/#{user.id}"
    mail(to: @user.email, subject: "Cool Bands Activation")

  end
end
