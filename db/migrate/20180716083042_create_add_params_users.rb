class CreateAddParamsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_params_users do |t|
      add_column :users, :name, :string
      add_column :users, :username, :string
      # add_column :users, :admin_type, :integer, :null => false, :default => 0
      add_reference :users, :role, foreign_key: true
      t.timestamps
    end
  end
end
