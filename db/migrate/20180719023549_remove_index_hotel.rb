class RemoveIndexHotel < ActiveRecord::Migration[5.2]
  # def up
  #   remove_column(:hotels, :package_id)
  #   add_column(:hotels, :package_id , :integer)
  # end
  # def down
  #   # add_column(:hotels, :package_id , :integer)
  #   remove_column(:hotels, :package_id)
  #   add_reference :hotels, :package, foreign_key: true
  # end
end
