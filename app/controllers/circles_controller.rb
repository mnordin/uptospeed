class CirclesController < ApplicationController

  def index
    set_back_url
    @pending_circles = current_user.circles.select{|c| c.accepted?(current_user) == false }
    @user_circles = current_user.circles.select{|c| c.accepted?(current_user) == true }
    @public_circles = Circle.order(:title).select{|c| c.public? }
  end

  def show
    @circle = Circle.find(params[:id])
    @accepted_users = @circle.accepted_users
    @pending_users = @circle.pending_users
  end

  def new
    @circle = Circle.new
    @users_grouped = User.order(:first_name).group_by {|u| u.name[0].upcase }
  end

  def edit
    @circle = Circle.find(params[:id])
    @users_grouped = User.order(:first_name).group_by {|u| u.name[0].upcase }
  end

  def create
    @circle = Circle.new(params[:circle])
    @circle.circle_memberships.select{|cm| cm.user == current_user }.first.attributes = { :accepted => true, :owner => true }
    if @circle.save
      redirect_to @circle, notice: 'Circle was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @circle = Circle.find(params[:id])

    if @circle.update_attributes(params[:circle])
      redirect_to @circle, notice: 'Circle was successfully updated.'
    else
      render action: "edit"
    end
  end

  def settings
    @circle = Circle.find(params[:id])
    @colors = Color.all
  end

  def remove_circle_membership
    circle = Circle.find(params[:id])
    cm = CircleMembership.find_by_circle_id_and_user_id(circle.id, params[:user_id])
    cm.destroy

    redirect_to circles_path
  end

  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy

    redirect_to circles_path
  end
end
