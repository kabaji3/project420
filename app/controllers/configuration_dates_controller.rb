class ConfigurationDatesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @users = current_user
    @configuration_list = ConfigurationDate.configuration_list(@users.group_id)
  end
  
  def show
    if current_user.admin_flg == 1
      group = Group.where(:id => current_user.group_id).first
      @nickname = group.name
#      @names = User.where(:group_id => current_user.group_id).where(:valid_flg => 1).order("created_at DESC")
#      @names = User.where(:group_id => current_user.group_id).order("created_at DESC")
      @names = User.find_by_sql(["select id , name , created_at from users where group_id = #{current_user.group_id} union select id + 1000000 as id , name , created_at  from members where group_id = #{current_user.group_id} order by created_at DESC"])
      @workplaces = Location.where(:group_id => current_user.group_id).order("created_at DESC")
      @users = current_user
    else
      group = Group.where(:id => current_user.group_id).first
      @nickname = group.name
#      @names = User.where(:group_id => current_user.group_id).where(:valid_flg => 1).order("created_at DESC")
#      @names = User.where(:group_id => current_user.group_id).order("created_at DESC")
      @names = User.find_by_sql(["select id , name , created_at from users where group_id = #{current_user.group_id} union select id + 1000000 as id , name , created_at  from members where group_id = #{current_user.group_id} order by created_at DESC"])
      @workplaces = Location.where(:group_id => current_user.group_id).order("created_at DESC")
      @users = current_user
    end

    #”z’uƒf[ƒ^‚Ì‰Šú’l
    @configuration = ConfigurationDate.find(params[:id])
    @sort_value = @configuration[:sort_value]
    @configuration_date = @configuration[:configuration_date]
    cookies[:sortables] = @configuration[:sort_value]
  end

  def new
  end

  def edit
    group = Group.where(:id => current_user.group_id).first
    @nickname = group.name
#    @names = User.where(:group_id => current_user.group_id).where(:valid_flg => 1).order("created_at DESC")
#    @names = User.where(:group_id => current_user.group_id).order("created_at DESC")
    @names = User.find_by_sql(["select id , name , created_at from users where group_id = #{current_user.group_id} union select id + 1000000 as id , name , created_at  from members where group_id = #{current_user.group_id} order by created_at DESC"])
    @workplaces = Location.where(:group_id => current_user.group_id).order("created_at DESC")
    @users = current_user

    @configuration = ConfigurationDate.where(:id => params[:id]).first
    if @configuration
      @sort_value = @configuration.sort_value
      @configuration_date = @configuration.configuration_date
      cookies[:sortables] = @configuration.sort_value
    end
  end

  def update
    if params[:sort_value]
      if configuration_date = ConfigurationDate.where(:id => params[:id]).first
        configuration_date.sort_value = params[:sort_value]
        configuration_date.save
      end
    end
  end

  def create
  end

  def destroy
    configuration_date = ConfigurationDate.find(params[:id])
    configuration_date.destroy
  end

  private

  def move_to_index
      redirect_to action: "index" unless user_signed_in?
  end

end
