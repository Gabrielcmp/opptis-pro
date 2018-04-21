class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :sex
      t.string :phone
      t.string :address
      t.string :formatted_address
      t.date :birth_date
      t.text :previous_experience

      t.timestamps
    end
  end
end
