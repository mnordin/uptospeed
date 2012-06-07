module UsersHelper
  def level_theme(level)
    if level.level < 6
      return "ui-body-f"
    elsif level.level < 9
      return "ui-body-e"
    else
      return "ui-body-g"
    end
  end
end