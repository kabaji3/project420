class AddAdminFlgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_flg, :integer
  end
end
