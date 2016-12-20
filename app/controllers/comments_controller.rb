class CommentsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.build
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.build(comment_params)

      if @comment.save
        UserMailer.comment_email(@campaign.user, @campaign, @comment).deliver_now
        redirect_to @campaign, notice: "Comment recorded"
      else
        flash[:error] = "Could not post comment"
        render :new
      end
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.find(params[:id])
    @comment.destroy
    redirect_to @campaign
  end

  protected
    def comment_params
      params.require(:comment).permit(:author, :message, :campaign_id)
    end

end
