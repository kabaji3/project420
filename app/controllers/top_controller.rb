class TopController < ApplicationController
  def index
    #‰‰ñ“o˜^Žž‚Ìˆ—
    if current_user.admin_flg.nil?
      users = User.where(:group_id => current_user.group_id).where(:admin_flg => 1).first
      if users
        User.where(:id => current_user.id).update_all(:admin_flg => 0)
        @admin_flg = 0
      else
        User.where(:id => current_user.id).update_all(:admin_flg => 1)
        @admin_flg = 1
      end
    end
  end
end
