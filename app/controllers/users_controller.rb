class UsersController < ApplicationController

  def profile

  end

  def index
    @users = User.where(:networking_status => true)
    if params[:radius].present?
      @radius = params[:radius].to_i
      @professionals = current_user.nearbys(@radius)
    else
      @professionals = current_user.nearbys(1584)
    end
  end

  def update
    current_user.first_name = params[:first_name]
    current_user.last_name = params[:last_name]
    current_user.phone_number = params[:phone_number]
    current_user.location = params[:location]
    current_user.company = params[:company]
    current_user.position = params[:position]
    current_user.pic_url = params[:pic]
    if params[:networking_status]
      current_user.networking_status = true
    else
      current_user.networking_status = false
    end

    if current_user.save
      redirect_to "/user_profile", :notice => "User profile updated successfully."
    else
      render 'index'
    end
  end
end


