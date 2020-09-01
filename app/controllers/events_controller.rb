class EventsController < ApplicationController
  def index
    @events = Event.all

    if search_params.present?
      @location = search_params["location"]
      @events = Event.where("location ILIKE ?", @location)
    end
  end

  def show
  end

 private

  def search_params
    params.require(:search).permit(:location)
  end

end
