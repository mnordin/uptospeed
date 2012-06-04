module UsersHelper
  def graph_theme(points)
    if points < 375
      return "ui-body-f"
    elsif points < 750
      return "ui-body-e"
    else
      return "ui-body-g"
    end
  end
end