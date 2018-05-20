class AddRestaurantToOpenings < ActiveRecord::Migration[5.1]
  def change
    add_reference :openings, :restaurant, index: true
    add_foreign_key :openings, :restaurants
  end
end
