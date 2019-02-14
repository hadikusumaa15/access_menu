class Tablemaxuserpackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :maxuser, :integer, :null => false, :default => 999
  end
end
