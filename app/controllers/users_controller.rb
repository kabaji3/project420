class UsersController < ApplicationController
  def show
    @users = current_user
    @nickname = current_user.company_name
    @names = current_user.members.order("created_at DESC")
    @workplaces = current_user.locations

    #”z’uƒf[ƒ^‚Ì‰Šú’l
    configuration = ConfigurationDate.configuration_init(@users.id)
    if configuration[0]
      @sort_value = configuration[0][:sort_value]
      @configuration_date = configuration[0][:configuration_date]
      cookies[:sortables] = configuration[0][:sort_value]
    end
  end

  def edit
  end

  def update
    #POST‚Ìê‡–³ðŒ‚Éupdate‚ª‘–‚é
    if params[:sort_value]
      @update_type = 2
      if configuration_date = ConfigurationDate.where(:user_id => params[:user_id]).where(:configuration_date => params[:configuration_date]).first
        configuration_date.sort_value = params[:sort_value]
        configuration_date.save
      else
        configuration_date = ConfigurationDate.new
        configuration_date.configuration_date = params[:configuration_date]
        configuration_date.user_id = params[:user_id]
        configuration_date.sort_value = params[:sort_value]
        configuration_date.save
      end
#      redirect_to :action => "show"
    else
      @update_type = 1
      current_user.update(update_params)
    end
  end

  private
  def update_params
    params.require(:user).permit(:company_name)
  end

end

