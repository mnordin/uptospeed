class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  has_many :events

  validates :email, :presence => true, :uniqueness => true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.first_name = auth["user_info"]["first_name"]
      user.first_name = auth["user_info"]["last_name"]
      user.email = auth["user_info"]["email"]
      user.authentications.find_or_create_by_provider_and_uid(auth["provider"], auth["uid"])
    end
  end

end
