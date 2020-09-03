class BookingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(participant_id: current_user.id, event_id: @event.id)
    @booking.event = @event
    @booking.save
    redirect_to dashboard_path
  end
end

