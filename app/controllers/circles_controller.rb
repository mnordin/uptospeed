class CirclesController < ApplicationController

  def index
    @public_circles = Circle.order(:title).select{|c| c.public? }
  end

  def show
    @circle = Circle.find(params[:id])
    @circle.users.sort!{ |a,b| a.name <=> b.name}
  end

  def new
    @circle = Circle.new
    @users_grouped = User.order(:first_name).group_by {|u| u.name[0].upcase }
  end

  def edit
    @circle = Circle.find(params[:id])
  end

  def create
    @circle = Circle.new(params[:circle])

    if @circle.save
      redirect_to circles_url, notice: 'Circle was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @circle = Circle.find(params[:id])

    if @circle.update_attributes(params[:circle])
      redirect_to circles_url, notice: 'Circle was successfully updated.'
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

    redirect_to circles_url
  end

  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy

    redirect_to circles_url
  end
end
