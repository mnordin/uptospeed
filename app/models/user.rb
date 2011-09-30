class User < ActiveRecord::Base
  has_many :events

  validates :email, :presence => true, :uniqueness => true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.first_name = auth["user_info"]["name"]
      user.email = auth["user_info"]["email"]
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end

end
