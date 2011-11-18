class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  # A user can't attend the same event more than once
  validates :user_id, :presence => true, :uniqueness => { :scope => :event_id }
  validates :event_id, :presence => true

  def self.already_exists?(params)
    Attendance.find_by_user_id_and_event_id(params[:user_id], params[:id]).present?
  end

end