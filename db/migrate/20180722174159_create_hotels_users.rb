class CreateHotelsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels_users do |t|
      t.references :user, foreign_key: true
      t.references :hotel, foreign_key: true
      t.timestamps
    end
  end
end
