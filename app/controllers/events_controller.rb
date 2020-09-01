class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    if search_params.present?
      @location = search_params["location"]
      @sport = search_params["sport"]
      @participant_date = search_params["participant_date"]
      @participant_time = search_params["participant_time"]
      @participant_date_time = @participant_date + ' ' + @participant_time + ':' + '23 UTC'
      @events = Event.where("location ILIKE ? AND sport = ? AND start_time < ? AND end_time > ?", @location, @sport, @participant_date_time, @participant_date_time)
    end
  end

 private
  def search_params
    params.require(:search).permit(:location, :sport, :participant_date, :participant_time)
  end
end
