class AddColumnsToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :cpf, :string
    add_column :candidates, :restaurant_experience, :boolean
  end
end
