# class CreateFilms < ActiveRecord::Migration[5.2]
#   def change
#     create_table :films do |t|

#       t.timestamps
#     end
#   end
# end

class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.decimal :ticket_price
      t.integer :rating_stars

      t.timestamps
    end
  end
end