class UserMailer < ApplicationMailer
  default from: 'FundNHelp@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/campaigns/new'#new_campaign_url
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def comment_email(user, campaign, comment)
    if user.isreceivingmail == true
      @user = user
      @campaign = campaign
      @comment = comment
      @url = 'localhost:3000/campaigns/:#{@campaign.id}'
      mail(to: @user.email, subject: 'You have made a comment')
    end
  end
  
end