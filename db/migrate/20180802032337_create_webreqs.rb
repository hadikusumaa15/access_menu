class CreateWebreqs < ActiveRecord::Migration[5.2]
  def change
    create_table :webreqs do |t|
      t.string :url
      t.timestamps
    end
  end
end
