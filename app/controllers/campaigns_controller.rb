class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      redirect_to root_path, notice: "Created Successfully."
    else
      flash[:error] = "Could not create campaign."
      render :new
    end
  end

  def index
    @campaigns = Campaign.where("ended_at >= ?", Time.now).order(:created_at).reverse
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])

    if @campaign.update_attributes(campaign_params)
      redirect_to @campaign, notice: "Updated Successfully!"
    else
      flash[:errors] = "Could not update campaign"
      render :new
    end
  end

  protected

    def campaign_params
      params.require(:campaign).permit(:title, :description, :review, :goal, :category, :imageurl, :user_id, :likes, :ended_at)
    end
end
