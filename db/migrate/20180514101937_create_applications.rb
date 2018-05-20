class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :candidate, foreign_key: true
      t.references :opening, foreign_key: true
      t.timestamps
    end
  end
end
