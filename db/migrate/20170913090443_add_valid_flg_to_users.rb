class AddValidFlgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :valid_flg, :integer, default: 1
  end
end
