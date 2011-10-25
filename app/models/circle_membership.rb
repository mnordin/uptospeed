class CircleMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle
  belongs_to :color

  after_destroy :destroy_circle_if_last_membership

  private
  def destroy_circle_if_last_membership
    circle.destroy if circle.accepted_users.count == 0
  end

end