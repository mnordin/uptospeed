class Color < ActiveRecord::Base
  has_many :circle_memberships

  def i18n_color
    I18n.t(:"circles.colors.#{color}")
  end
end
