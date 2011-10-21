module ApplicationHelper

  def back_button_url
    return session[:back_url] || root_path
  end

  def highlight_current_tab(controller_name)
    if controller_name == params[:controller]
      return "ui-btn-active"
    else
      return ""
    end
  end

  def data_theme(params)
    return "a" if params[:action] =~ /show|map/ && params[:controller] != "users"
    return "b"
  end

  def fake_dialog(params)
    return "ui-dialog ui-body-a" if params[:action] == "show" && params[:controller] != "users"
  end

  def ring(args = {})
    if args[:user].present?
      user = args[:user]
      rings = []
      return "" if user == current_user
      user.circles.each do |circle|
        if user.has_accepted_membership?(circle)
          rings << ring(:circle => circle)
        end
      end
      rings.join("").html_safe
    elsif args[:event].present?
      event = args[:event]
      rings = []
      event.users.delete_if{|u| u == current_user}
      event.users.each do |user|
        rings << ring(:user => user)
      end
      rings.flatten.uniq.join("").html_safe
    elsif args[:circle].present?
      circle = args[:circle]
      if current_user.circles.include?(circle) && current_user.has_accepted_membership?(circle)
        membership = current_user.circle_memberships.select{|cm| cm.circle == circle}.first
        color = membership.color.hex rescue "transparent"
        print_ring_html(color).html_safe
      end
    end
  end

  private
  def print_ring_html(color)
    "<div class=\"ring\" style=\"background:#{color}\"></div>"
  end
end
