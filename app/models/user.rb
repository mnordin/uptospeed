class User < ActiveRecord::Base
  has_many :events, :through => :attendances
  has_many :attendances
  belongs_to :office

  validates :email, :presence => true, :uniqueness => true

  def name
    "#{first_name} #{last_name}"
  end

  def total_score
    events.past.map(&:score).sum
  end

  def has_accepted_membership?(circle)
    circle_memberships.select{|cm| cm.circle == circle }.map(&:accepted?).first == true
  end

  def hasnt_accepted_membership?(circle)
    circle_memberships.select{|cm| cm.circle == circle }.map(&:accepted?).first == false
  end

  def pending_memberships
    circle_memberships.select{|cm| cm.accepted? == false }
  end

  def self.total_points_this_month
    this_month = {:created_at => Time.now.beginning_of_month..Time.now.end_of_month}
    Attendance.where(this_month).count + Workout.where(this_month).count + Learning.where(this_month).count
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
