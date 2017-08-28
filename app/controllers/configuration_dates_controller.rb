class ConfigurationDatesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @users = current_user
    @configuration_list = ConfigurationDate.configuration_list(@users.id)
  end

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

  def new
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
