class CirclesController < ApplicationController
  # GET /circles
  # GET /circles.json
  def index
    @circles = Circle.all
    @user = current_user
  end

  # GET /circles/1
  # GET /circles/1.json
  def show
    @circle = Circle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @circle }
    end
  end

  def new
    @circle = Circle.new
    @users_grouped = User.order(:first_name).group_by {|u| u.name[0].upcase }
  end

  # GET /circles/1/edit
  def edit
    @circle = Circle.find(params[:id])
  end

  # POST /circles
  # POST /circles.json
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
      redirect_to circles_url, notice: 'Circle was successfully created.'
    else
      render action: "edit"
    end
  end

  def settings
    @circle = Circle.find(params[:id])
  end

  def remove_circle_membership
    circle = Circle.find(params[:id])
    cm = CircleMembership.find_by_circle_id_and_user_id(circle.id, params[:user_id])
    cm.destroy
    redirect_to circles_url
  end

  # DELETE /circles/1
  # DELETE /circles/1.json
  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy

    respond_to do |format|
      format.html { redirect_to circles_url }
      format.json { head :ok }
    end
  end
end
