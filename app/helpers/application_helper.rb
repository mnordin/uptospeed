module ApplicationHelper

  def back_button_url
    session[:back_url] || root_path
  end

  def highlight_current_tab(controller_name)
    "ui-btn-active" if controller_name == params[:controller]
  end

  def you_class(user)
    ' class="you"' if user == current_user
  end
end
