class UsersController < ApplicationController

#  protect_from_forgery except: :valid_update

#  def valid_update
#    ret = User.where(:id => params[:id]).update_all(:valid_flg => params[:valid_flg])
#    render :json =>  { result: ret }
#  end

  def index
    @users = User.where(:group_id => current_user.group_id)
    @members = Member.where(:group_id => current_user.group_id).where(:display_flg => 1)
  end

  def show
    if current_user.admin_flg == 1
      group = Group.where(:id => current_user.group_id).first
      @nickname = group.name

#      @names = User.where(:group_id => current_user.group_id).where(:valid_flg => 1).order("created_at DESC")
      @names = User.find_by_sql(["select id , name , created_at from users where group_id = #{current_user.group_id} and valid_flg = 1 union select id + 1000000 as id , name , created_at  from members where group_id = #{current_user.group_id} and valid_flg = 1 order by created_at DESC"])

      @workplaces = Location.where(:group_id => current_user.group_id).order("created_at DESC")

      #”z’uƒf[ƒ^‚Ì‰Šú’l
      @users = current_user
      configuration = ConfigurationDate.configuration_init(@users.group_id).first
      if configuration
        @sort_value = configuration.sort_value
        @configuration_date = configuration.configuration_date
        cookies[:sortables] = configuration.sort_value
      end
      render :action => "admin_show"
    else 
      render :action => "show"
    end
  end

  def edit
  end

  def update
    #POST‚Ìê‡–³ðŒ‚Éupdate‚ª‘–‚é
    if params[:sort_value]
      @update_type = 2
      if configuration_date = ConfigurationDate.where(:user_id => params[:user_id]).where(:group_id => params[:group_id]).where(:configuration_date => params[:configuration_date]).first
        configuration_date.sort_value = params[:sort_value]
        configuration_date.save
      else
        configuration_date = ConfigurationDate.new
        configuration_date.configuration_date = params[:configuration_date]
        configuration_date.user_id = params[:user_id]
        configuration_date.group_id = params[:group_id]
        configuration_date.sort_value = params[:sort_value]
        configuration_date.save
      end
    end
    if params[:valid_update] == "1"
      User.where(:group_id => current_user.group_id).update_all(:valid_flg => 0)
      if params[:user]
        params[:user].each{ | id |
          User.where(:id => id).update_all(:valid_flg => 1)
        }
      end
      Member.where(:group_id => current_user.group_id).update_all(:valid_flg => 0)
      if params[:member] 
        params[:member].each{ | id |
          Member.where(:id => id).update_all(:valid_flg => 1)
        }
      end
      redirect_to :action => "index"
    else
      if params[:user]
        if params[:user][:name]
          @update_type = 1
          User.where(:id => params[:id]).update_all(:name => params[:user][:name])
        end
      end
    end
#      redirect_to :action => "show"
  end

  private
  def update_params
    params.require(:user).permit(:name)
  end

end
