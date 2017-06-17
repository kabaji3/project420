class MembersController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @members = current_user.members.order ("created_at DESC")
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    Member.create(name: member_params[:name], user_id: current_user.id)
  end

  def destroy
      member = Member.find(params[:id])
      if member.user_id == current_user.id
        member.destroy
      end
  end

  private
  def member_params
    params.require(:member).permit(:name)
  end

  def move_to_index
      redirect_to action: "index" unless user_signed_in?
  end


end
