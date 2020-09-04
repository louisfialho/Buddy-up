module ApplicationHelper
  def should_i_display_the_search_bar?
    if (controller_name == "pages" && action_name == "home") ||
       (controller_name == "sessions" && action_name == "new") ||
       (controller_name == "registrations" && action_name == "new") ||
       (controller_name == "pages" && action_name == "dashboard")
      # add any additional pages here to reomve search bar in nav_bar
      false
    else
      true
    end
  end

  def should_i_display_the_search_bar_background?
    if controller_name == "pages" && action_name == "home"
      false
    else
      true
    end
  end

  # def current_user_events_to_review?
  #   current_user.bookings.each do |booking|
  #     if booking.event.end_time < Time.now
  #       return booking.event.sport
  #     end
  #   end
  # end
end
