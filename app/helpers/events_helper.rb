module EventsHelper

  def next_link_params
    start_at = params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week
    return {:start_at => start_at + 1.week}
  end

  def prev_link_params
    start_at = params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week
    return {:start_at => start_at - 1.week}
  end


  # Weekdays helpers
  def which_weekday?(event, day)
    weekdays = {
      1 => "monday",
      2 => "tuesday",
      3 => "wednesday",
      4 => "thursday",
      5 => "friday"
    }
    event_day = weekdays[event.start_time.wday]
    if event_day == day
      return true
    else
      return false
    end
  end

end
