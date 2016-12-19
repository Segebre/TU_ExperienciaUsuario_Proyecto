class DonationsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.build
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.build(donation_params)

      if @donation.save
        redirect_to @campaign, notice: "Donation recorded"
      else
        flash[:error] = "Could not post donation"
        render :new
      end
  end

  protected
    def donation_params
      params.require(:donation).permit(:author, :message, :amount, :campaign_id)
    end
end
