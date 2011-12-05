class UsersController < ApplicationController
  #before_filter :require_authed_user

  def index
    @users = User.all
  end

  def show
    set_back_url
    @user = User.find(current_user.id)
    @duration = @user.past_events.map(&:duration).sum / 3600
  end

  def edit
    @user = User.find(params[:id])
    @offices = Office.all
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

  def log_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
