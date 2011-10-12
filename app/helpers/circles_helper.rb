module CirclesHelper

  def user_score(circle_memberships, user)
    if circle_memberships.select{|cm| cm.user == user}.first.share_score?
      user.total_score
    else
      ""
    end
  end
end
