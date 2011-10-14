module EventsHelper

  def next_link_params
    start_at = params[:start_at].present? ? Time.parse(params[:start_at]) : Time.now.beginning_of_week
    start_at += 1.week
    return {:start_at => start_at.strftime("%Y-%m-%d")}
  end

  def prev_link_params
    start_at = params[:start_at].present? ? Time.parse(params[:start_at]) : Time.now.beginning_of_week
    start_at -= 1.week
    return {:start_at => start_at.strftime("%Y-%m-%d")}
  end

  def monday_param
    params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week.strftime("%Y-%m-%d")
  end

  def old?(date)
    date.end_of_day < Time.now
  end

end
