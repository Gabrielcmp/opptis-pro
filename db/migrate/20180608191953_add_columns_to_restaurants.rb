class AddColumnsToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :manager_phone, :string
    add_column :restaurants, :manager_name, :string
  end
end
