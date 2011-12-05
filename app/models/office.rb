class Office < ActiveRecord::Base
  has_many :users
  belongs_to :locale
end
