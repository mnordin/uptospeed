# -*- encoding: utf-8 -*-
module EventsHelper

  def future_events_params
    future_weeks = params[:future_weeks].present? ? params[:future_weeks].to_i + 1 : 2
    past_weeks = params[:past_weeks] || 1
    return { future_weeks: future_weeks, past_weeks: past_weeks }
  end

  def past_events_params
    future_weeks = params[:future_weeks] || 1
    past_weeks = params[:past_weeks].present? ? params[:past_weeks].to_i + 1 : 2
    return { future_weeks: future_weeks, past_weeks: past_weeks }
  end

  def monday_param
    params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week.strftime("%Y-%m-%d")
  end

  def geo?(event)
    event.lat.present? and event.lng.present?
  end

  def old?(date)
    date.end_of_day < Time.now
  end

  def today?(date, collection)
    if collection.keys.include?(Time.now.to_date)
      return " today" if date == Time.now.to_date
    else
      return " today" if [date.to_date-1.days, date.to_date, date.to_date+1.days].include?(Time.now.to_date)
    end
  end

  def places(address)
    return "Sats Medborgarplatsen"        if address =~ /Kocksgatan 12/
    return "Eriksdalsbadet"               if address =~ /Hammarby Slussväg 20/
    return "Mynewsdesk Stockholmskontor"  if address =~ /Rosenlundsgatan 40/
    return "Fryshuset"                    if address =~ /Mårtensdalsgatan 6/
    return "VBC Sportcenter"              if address =~ /Södermalmsallen 14/
  end
end
