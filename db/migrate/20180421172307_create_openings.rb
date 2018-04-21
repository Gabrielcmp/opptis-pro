class CreateOpenings < ActiveRecord::Migration[5.1]
  def change
    create_table :openings do |t|
      t.string :title
      t.string :type
      t.date :beginning_date
      t.date :end_date
      t.string :pref_sex
      t.string :pref_age
      t.boolean :previous_experience
      t.text :description

      t.timestamps
    end
  end
end
