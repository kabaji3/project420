class AddGroupIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :group_id, :integer
  end
end
