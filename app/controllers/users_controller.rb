require "uptospeed/level"
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    set_back_url
    @user = User.find(current_user.id)
    @duration = @user.events.past.map(&:duration).sum / 3600
    @total_points = Event.total(Time.now)
    @level = Level.new(@total_points)
    @percentage = (Float(@level.start_level - @total_points) / (@level.start_level - @level.next_level)) * 100
  end

  def edit
    @user = User.find(params[:id])
    @offices = Office.all
    @locales = [[t(:'locales.en'), "en"], [t(:'locales.sv'), "sv"]]
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def stats
    @month_before_last = Event.total(2.months.ago.beginning_of_month)
    @last_month = Event.total(1.months.ago.beginning_of_month)
    @this_month = Event.total(Time.now.beginning_of_month)
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path
  end

  def levels_info; end
end
