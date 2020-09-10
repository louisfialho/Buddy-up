class ReviewsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event = @event
    @review.reviewer_id = current_user.id
    # works for only organise but not participant || @event.participant_id
    @review.reviewee_id = @event.organizer_id
    if @review.save
       @review = Review.new
          respond_to do |format|
                  format.js
                  format.html { redirect_to event_path, notice: 'Book was successfully created.' }
              end
          else
              respond_to do |format|
                  format.js
                  format.html { render "events/show", notice: 'something went wrong' }
          end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :text, :reviewer_id, :reviewee_id)
  end
end
