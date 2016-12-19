class CampaignsController < ApplicationController
  skip_before_action :authorize, only: [:show, :index, :category_campaigns]

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      redirect_to campaign_path(@campaign), notice: "Created Successfully."
    else
      flash[:error] = "Could not create campaign."
      render :new
    end
  end

  def index
    @campaigns = Campaign.not_ended.order(:created_at).reverse
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])

    if campaign_params[:ended_at] <= @campaign.ended_at && @campaign.update_attributes(campaign_params)
      redirect_to @campaign, notice: "Updated Successfully!"
    else
      flash[:errors] = "Could not update campaign"
      render :edit
    end
  end

  def category_campaigns
    @campaigns = Campaign.not_ended.where(category: params[:category]).order(:created_at).reverse
    @category = params[:category]
  end

  def dashboard_campaigns
    @campaigns = Campaign.not_ended.where(user_id: current_user.id).order(:created_at).reverse
  end

  def destroy
    Campaign.find(params[:id]).destroy
    redirect_to root_path, notice: "Successfully Destroyed!"
  end

  protected

    def campaign_params
      params.require(:campaign).permit(:title, :description, :review, :goal, :category, :imageurl, :user_id, :likes, :ended_at)
    end
end
