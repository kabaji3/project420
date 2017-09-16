class AddDisplayFlgToMembers < ActiveRecord::Migration
  def change
    add_column :members, :display_flg, :integer, default: 1
  end
end
