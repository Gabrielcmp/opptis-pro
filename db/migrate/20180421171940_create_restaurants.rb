class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cnpj
      t.string :cousine
      t.string :phone
      t.string :address
      t.string :formatted_address

      t.timestamps
    end
  end
end
