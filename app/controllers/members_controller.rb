class MembersController < ApplicationController

  before_action :move_to_index, except: :index

  def index
#    @members = current_user.members.where(:group_id => current_user.group_id).order ("created_at DESC")
  end

  def edit
    @member = Member.find_by(params[:id])
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    Member.create(name: member_params[:name], group_id: current_user.group_id)
  end

  def update
    if params[:member]
      if params[:member][:name]
        Member.where(:id => params[:id]).update_all(:name => params[:member][:name])
      end
    end
  end

  def destroy
    Member.where(:id => params[:id]).update_all(:display_flg => 0)
    Member.where(:id => params[:id]).update_all(:valid_flg => 0)
  end

  private
  def member_params
    params.require(:member).permit(:name)
  end

  def move_to_index
      redirect_to action: "index" unless user_signed_in?
  end


end
