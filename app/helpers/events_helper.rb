# -*- encoding: utf-8 -*-
module EventsHelper
  def future_events_params
    now = params[:now].present? ? Time.parse(params[:now]) : Time.now
    now = (now + 1.weeks).to_date
    { now: now }
  end

  def past_events_params
    now = params[:now].present? ? Time.parse(params[:now]) : Time.now
    now = (now - 1.weeks).to_date
    { now: now }
  end

  def now_from_params
    params[:now].present? ? Time.parse(params[:now]) : Time.now
  end

  def exists_after?(time)
    if weekend?(time)
      Event.exists_after?(time + 1.weeks)
    else
      Event.exists_after?(time)
    end
  end

  def exists_before?(time)
    if weekend?(time)
      Event.exists_before?(time + 1.weeks)
    else
      Event.exists_before?(time)
    end
  end

  def geo?(event)
    event.lat.present? and event.lng.present?
  end

  def old?(event)
    event.start_time.end_of_day < Time.now
  end

  def today?(date)
    " today" if date == Time.now.to_date
  end

  def places(address)
    return "Sats Medborgarplatsen"        if address =~ /Kocksgatan 12/
    return "Eriksdalsbadet"               if address =~ /Hammarby Slussväg 20/
    return "Mynewsdesk Stockholmskontor"  if address =~ /Rosenlundsgatan 40/
    return "Fryshuset"                    if address =~ /Mårtensdalsgatan 6/
    return "VBC Sportcenter"              if address =~ /Södermalmsallen 14/
  end
end
