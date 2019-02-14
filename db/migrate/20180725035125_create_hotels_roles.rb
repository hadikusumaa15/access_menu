class CreateHotelsRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels_roles do |t|
      t.references :role, foreign_key: true
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
