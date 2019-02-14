class CreateMenusPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :menus_packages do |t|
      t.references :package, foreign_key: true
      t.references :menu, foreign_key: true
      t.timestamps
    end
  end
end
