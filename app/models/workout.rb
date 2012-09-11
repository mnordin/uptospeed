class Workout < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :presence => true

  scope :this_month, lambda { where("created_at > ?", Time.now.beginning_of_month) }

  def title
    self.class.to_s
  end

  def start_time
    self.created_at
  end
end