# -*- encoding: utf-8 -*-
module EventsHelper

  def future_events_params
    now = params[:now].present? ? Time.parse(params[:now]) : Time.now
    now = (now + 11.days).to_date
    return { now: now }
  end

  def past_events_params
    now = params[:now].present? ? Time.parse(params[:now]) : Time.now
    now = (now - 11.days).to_date
    return { now: now }
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
    return " today" if date == Time.now.to_date
  end

  def places(address)
    return "Sats Medborgarplatsen"        if address =~ /Kocksgatan 12/
    return "Eriksdalsbadet"               if address =~ /Hammarby Slussväg 20/
    return "Mynewsdesk Stockholmskontor"  if address =~ /Rosenlundsgatan 40/
    return "Fryshuset"                    if address =~ /Mårtensdalsgatan 6/
    return "VBC Sportcenter"              if address =~ /Södermalmsallen 14/
  end
end
