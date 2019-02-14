class CreateMenusRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :menus_roles do |t|
      t.references :menu, foreign_key: true
      t.references :role, foreign_key: true
      t.timestamps
    end
  end
end
