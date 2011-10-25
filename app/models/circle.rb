class Circle < ActiveRecord::Base
  has_many :users, :through => :circle_memberships
  has_many :circle_memberships, :dependent => :destroy

  accepts_nested_attributes_for :circle_memberships, :reject_if => lambda { |cm| cm[:user_id].blank? }, :allow_destroy => true

  validates :title, :presence => true

  def accepted?(user)
    accepted_users.include?(user)
  end

  def pending?(user)
    pending_users.include?(user)
  end

  def accepted_users
    users.select{|u| u.has_accepted_membership?(self) }
  end

  def pending_users
    users.select{|u| u.hasnt_accepted_membership?(self) }
  end
end
