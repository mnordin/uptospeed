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

end
