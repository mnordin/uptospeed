module CirclesHelper

  def user_score(circle_memberships, user)
    circle_membership = circle_memberships.select{|cm| cm.user == user}.first
    if circle_membership.share_score? and circle_membership.circle.users.include?(current_user)
      user.total_score
    else
      ""
    end
  end
end
