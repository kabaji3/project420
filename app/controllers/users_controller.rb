class UsersController < ApplicationController
  def show
    @nickname = current_user.company_name
    @names = current_user.members.order("created_at DESC")
    @workplaces = current_user.locations
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:company_name)
  end

end
