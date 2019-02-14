class CreateAdminsHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :admins_hotels do |t|
      t.references :admin, foreign_key: true
      t.references :hotel, foreign_key: true
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
