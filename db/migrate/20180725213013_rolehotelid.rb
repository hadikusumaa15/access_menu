class Rolehotelid < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :hotel, foreign_key: true
  end
end
