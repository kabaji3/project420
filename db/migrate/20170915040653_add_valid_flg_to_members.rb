class AddValidFlgToMembers < ActiveRecord::Migration
  def change
    add_column :members, :valid_flg, :integer, default: 1
  end
end
