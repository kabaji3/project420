class AddGroupIdToConfigurationDates < ActiveRecord::Migration
  def change
    add_column :configuration_dates, :group_id, :integer
  end
end
