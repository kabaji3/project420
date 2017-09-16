class LocationsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @locations = current_user.locations.where(:group_id => current_user.group_id).order ("created_at DESC")
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    Location.create(workplace: location_params[:workplace], user_id: current_user.id, group_id: current_user.group_id)
  end

  def destroy
      location = Location.find(params[:id])
      if location.user_id == current_user.id
        location.destroy
      end
  end

  private
  def location_params
    params.require(:location).permit(:workplace)
  end

  def move_to_index
      redirect_to action: "index" unless user_signed_in?
  end

end
