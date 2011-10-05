module EventsHelper

  def next_link
    start_at = params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week
    end_at = params[:end_at].present? ? params[:end_at] : Time.now.end_of_week
    
    return {:start_at => start_at + 1.week, :end_at => end_at + 1.week}
  end

  def prev_link
    start_at = params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week
    end_at = params[:end_at].present? ? params[:end_at] : Time.now.end_of_week
    
    return {:start_at => start_at - 1.week, :end_at => end_at - 1.week}
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
