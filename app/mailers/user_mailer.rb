class UserMailer < ApplicationMailer
  default from: 'FundNHelp@gmail.com'

  def welcome_email(user)
      @user = user
      @url = 'localhost:3000/campaigns/new'#new_campaign_url
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
  
end