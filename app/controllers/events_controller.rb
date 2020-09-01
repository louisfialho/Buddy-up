class EventsController < ApplicationController
  def index
    @events = Event.all

    # if search_params.present?
    #   @location = search_params["location"]
    #   @sport = search_params["sport"]
    #   @events = Event.where("location ILIKE ? AND sport ILIKE ?", @location, @sport)
    # end


    if search_params.present?
      @location = search_params["location"]
      if search_params["sport"].present?
        @sport = search_params["sport"]
        @events = Event.where("location ILIKE ? AND sport = ?", @location, @sport)
      else
        @events = Event.where("location ILIKE ?", @location)
      end
    end

  end

  def show
  end

 private

  def search_params
    params.require(:search).permit(:location, :sport)
  end

end
