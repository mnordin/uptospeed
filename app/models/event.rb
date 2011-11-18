class Event < ActiveRecord::Base
  has_many :users, :through => :attendances
  has_many :attendances

  validates :google_id, :presence => true, :uniqueness => true

  def score
    1
  end

  def duration
    end_time - start_time
  end

  def group_by_date
    start_time.to_date
  end

  def self.exists_before?(time)
    Event.order(:start_time).limit(1).first.start_time < time.beginning_of_week
  end

  def self.exists_after?(time)
    Event.order(:start_time).reverse_order.limit(1).first.start_time > time.end_of_week
  end
end