class ForeignAdmin < ActiveRecord::Migration[5.2]
  def change
    add_reference :admins, :role, foreign_key: true
    # add_reference :roles, :admin, foreign_key: true
  end
end
