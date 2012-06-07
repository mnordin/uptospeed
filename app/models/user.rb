class User < ActiveRecord::Base
  has_many :events, :through => :attendances
  has_many :attendances
  has_many :workouts
  has_many :learnings

  belongs_to :office

  validates :email, :presence => true, :uniqueness => true

  def name
    "#{first_name} #{last_name}"
  end

  def events_learnings_and_workouts_this_month
    (workouts.where({:created_at => Time.now.beginning_of_month..Time.now.end_of_month}) +
    learnings.where({:created_at => Time.now.beginning_of_month..Time.now.end_of_month}) +
    events.where({:start_time => Time.now.beginning_of_month..Time.now.end_of_month})).sort { |o, p| o.created_at <=> p.created_at }.reverse
  end

  def all_events_learnings_and_workouts
    { "Workouts" => workouts.count, "Learnings" => learnings.count, "Events" => events.count }
  end

  def total_score
    events.past.count
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.first_name = auth["user_info"]["first_name"]
      user.last_name = auth["user_info"]["last_name"]
      user.email = auth["user_info"]["email"]
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end

end
