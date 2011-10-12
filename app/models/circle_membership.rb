class CircleMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle
  belongs_to :color
end