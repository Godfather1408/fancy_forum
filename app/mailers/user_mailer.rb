class UserMailer < ActionMailer::Base
  default from: "fancyforum@mail.com"
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to FancyForum')
  end
  
  def favorite_email(user, topic)
    @user = user
    @topic = topic
    mail(to: @user.email, subject: 'Favorite updated')
  end
end
