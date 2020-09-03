class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @my_bookings = current_user.bookings
    @my_events = current_user.events
  end

  def buddy_space
     @my_bookings = current_user.bookings
  end


  def organizer_space
     @my_events = current_user.events
  end
end
