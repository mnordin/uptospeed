module UsersHelper
  def graph_theme(points)
    if points < 350
      return "ui-body-f"
    elsif points < 700
      return "ui-body-e"
    else
      return "ui-body-g"
    end
  end
end