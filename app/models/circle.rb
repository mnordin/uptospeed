class Circle < ActiveRecord::Base
  has_many :users, :through => :circle_memberships
  has_many :circle_memberships, :dependent => :destroy

  accepts_nested_attributes_for :circle_memberships, :reject_if => lambda { |cm| cm[:user_id].blank? }, :allow_destroy => true

  validates :title, :presence => true
end
