module ApplicationHelper

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def highlight_current_tab(controller_name)
    if controller_name == params[:controller]
      return "ui-btn-active"
    else
      ""
    end
  end

end
