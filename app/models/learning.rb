class Learning < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :presence => true

  def title
    self.class.to_s
  end

  def start_time
    self.created_at
  end
end