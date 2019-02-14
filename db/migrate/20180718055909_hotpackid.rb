class Hotpackid < ActiveRecord::Migration[5.2]
  def change
    add_reference :hotels, :package, foreign_key: true
  end
end
