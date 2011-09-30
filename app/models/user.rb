class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  has_many :events

  validates :email, :presence => true, :uniqueness => true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end

end
