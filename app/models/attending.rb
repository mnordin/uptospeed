class Attending < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  # A user can't attend the same event more than once
  validates :user_id, :uniqeuness => { :scope => :event_id }
end