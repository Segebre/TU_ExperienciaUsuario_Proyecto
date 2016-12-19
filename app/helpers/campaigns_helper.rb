module CampaignsHelper
  def total_donations(campaign)
    campaign.donations.sum(:amount)
  end
end
