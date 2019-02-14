class AdminType < ActiveRecord::Migration[5.2]
  def up
          add_column :users, :admin_type, :integer, :null => false, :default => 0
  end

  def down
    add_column :users, :admin_type, :integer, :null => false, :default => 0
  end
end
