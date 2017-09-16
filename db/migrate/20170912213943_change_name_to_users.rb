class ChangeNameToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :company_name, :name
  end
end
