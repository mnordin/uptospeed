class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy

  validates :email, :presence => true, :uniqueness => true

  def self.find_or_create_by_omniauth_hash(hash)
    #omniauth_hash["user_info"]["email"]
    return User.find_by_email(hash["user_info"]["email"]) || User.create_from_hash(hash)
  end

  private
  def self.create_from_hash(hash)
    User.create(
      :first_name => hash["user_info"]["first_name"],
      :last_name => hash["user_info"]["last_name"],
      :email => hash["user_info"]["email"]
    )
  end

end
