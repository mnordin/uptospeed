module ApplicationHelper

  def back_button_url
    session[:back_url] || root_path
  end

  def highlight_current_tab(controller_name)
    "ui-btn-active" if controller_name == params[:controller]
  end

  def ring(options = {})
    if options[:user].present?
      user = options[:user]
      rings = rings_for_user(user)
      rings.join("").html_safe
    elsif options[:event].present?
      event = options[:event]
      event.users.delete_if{|u| u == current_user}
      rings = event.users.collect { |user| rings_for_user(user) }
      rings.flatten.uniq.join("").html_safe
    elsif options[:circle].present?
      circle = options[:circle]
      if current_user.circles.include?(circle) && current_user.has_accepted_membership?(circle)
        membership = current_user.circle_memberships.select{|cm| cm.circle == circle}.first
        color = membership.color.hex rescue "transparent"
        print_ring_html(color).html_safe
      end
    end
  end

  def you_class(user)
    ' class="you"' if user == current_user
  end

  private
  def print_ring_html(color)
    "<div class=\"ring\" style=\"background:#{color}\"></div>"
  end

  def rings_for_user(user)
    return [] if user == current_user
    rings = user.circles.collect do |circle|
      if user.has_accepted_membership?(circle)
        ring(:circle => circle)
      end
    end
    rings.compact
  end
end
