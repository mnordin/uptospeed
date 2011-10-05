class User < ActiveRecord::Base
  has_many :events, :through => :attendings

  validates :email, :presence => true, :uniqueness => true

  def name
    "#{first_name} #{last_name}"
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
