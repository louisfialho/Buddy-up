class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.bookings.destroy_all
    @event.destroy
    redirect_to dashboard_path(tab: "organizer_space")
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to dashboard_path(tab: "organizer_space")
  end

  def create
    @user = current_user
    @event = Event.new(event_params)
    @event.organizer = @user
    @event.save
    redirect_to dashboard_path(tab: "organizer_space")
  end

  def show
    @review = Review.new
    @event = Event.find(params[:id])
    @booking = Booking.new
  end

  def index
    @events = Event.all
    if search_params.present?
      if search_params["location"].present? && search_params["sport"].present? && search_params["participant_date"].present? && search_params["participant_time"].present?
        @location = search_params["location"]
        @sport = search_params["sport"]
        @participant_date = search_params["participant_date"]
        @participant_time = search_params["participant_time"]
        @participant_date_time = @participant_date + ' ' + @participant_time + ':' + '23 UTC'
        @events = Event.where("location ILIKE ? AND sport = ? AND start_time < ? AND end_time > ?", @location, @sport, @participant_date_time, @participant_date_time)
      elsif search_params["location"].present? && search_params["sport"].present? && search_params["participant_date"].present?
        @location = search_params["location"]
        @sport = search_params["sport"]
        @participant_date = search_params["participant_date"]
        @events = Event.where("location ILIKE ? AND sport = ? AND LEFT(start_time, 10) = ?", @location, @sport, @participant_date)
      elsif search_params["location"].present? && search_params["sport"].present?
        @location = search_params["location"]
        @sport = search_params["sport"]
        @events = Event.where("location ILIKE ? AND sport = ?", @location, @sport)
      elsif search_params["location"].present?
        @location = search_params["location"]
        @events = Event.where("location ILIKE ?", @location)
      end
    end

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

 private
  def search_params
    params.require(:search).permit(:location, :sport, :participant_date, :participant_time)
  end

  def event_params
    params.require(:event).permit(:sport, :start_time, :end_time, :address, :photo)
  end
end
