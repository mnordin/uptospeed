class Authentication < ActiveRecord::Base
  belongs_to :user

  validate :uid, :uniqueness => { :scope => :user_id }
end
