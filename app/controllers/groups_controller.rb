class GroupsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
  end

  def show
  end

  def new
  end

  def update
    Group.where(:id => current_user.group_id).update_all(:name => params[:group][:name])
  end

  def edit
    @groups = Group.find_by(current_user.group_id)
  end

  def create
#    Group.create(name: group_params[:name], user_id: current_user.id, group_id: current_user.group_id)
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def move_to_index
      redirect_to action: "index" unless user_signed_in?
  end


end
