class CircleMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle
end