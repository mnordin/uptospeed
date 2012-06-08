module UsersHelper
  def level_theme(level)
    if level.level < 7
      return "ui-body-f"
    elsif level.level < 10
      return "ui-body-e"
    else
      return "ui-body-g"
    end
  end
end