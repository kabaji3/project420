class ConfigurationDate < ActiveRecord::Base

  def self.configuration_init(group_id)
    configuration_date = ConfigurationDate.where("group_id = ?" , group_id).order("configuration_date desc").limit(1)
    if configuration_date
      return configuration_date
    else
      return ""
    end
  end

  def self.configuration_list(group_id)
    configuration_list = ConfigurationDate.where("group_id = ?" , group_id).order("configuration_date desc")
    if configuration_list
      return configuration_list
    else
      return nil
    end
  end

end
