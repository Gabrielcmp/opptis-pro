class AddShiftToOpenings < ActiveRecord::Migration[5.1]
  def change
    add_column :openings, :shift, :string
  end
end
