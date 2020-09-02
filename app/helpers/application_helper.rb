module ApplicationHelper
  def should_i_display_the_search_bar?
    if (controller_name == "pages" && action_name == "home") ||
       (controller_name == "sessions" && action_name == "new") ||
       (controller_name == "registrations" && action_name == "new")
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
end
