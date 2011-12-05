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
end