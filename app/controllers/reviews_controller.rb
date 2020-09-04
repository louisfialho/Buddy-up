class ReviewsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event = @event
    @review.reviewer_id = current_user.id
    # works for only organise but not participant || @event.participant_id
    @review.reviewee_id = @event.organizer_id
    if @review.save
      redirect_to event_path(@event, anchor: "anchor")
    else
      render "events/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :text, :reviewer_id, :reviewee_id)
  end
end
