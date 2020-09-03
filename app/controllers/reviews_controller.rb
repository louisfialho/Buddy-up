class ReviewsController < ApplicationController
  def create
    @event = Event.find(params[:flat_id])
    @review = Review.new(review_params)
    @review.event = @event
    @review.reviewer_id = current_user.id
    if @review.save
      redirect_to event_path(@event, anchor: "anchor")
    else
      redirect_to event_path(@event)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :text)
  end
end
