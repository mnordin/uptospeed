class Office < ActiveRecord::Base
  has_many :users

  def default_locale
    case title
      when "stockholm"
        "sv"
      when "malmoe"
        "sv"
      when "gothenburg"
        "sv"
      else
        I18n.default_locale
    end
  end

  def i18n_title
    I18n.t(:"offices.#{title}")
  end
end