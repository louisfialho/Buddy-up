class BookingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    if @event.bookings.present?
       @chatroom = @event.bookings.first.chatroom
    else
       @chatroom = Chatroom.new(name: Faker::IDNumber.valid)
       @chatroom.save!
    end
      @booking = Booking.new(participant_id: current_user.id, event_id: @event.id, chatroom: @chatroom)
      @booking.event = @event
      @booking.save
      redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end
end

