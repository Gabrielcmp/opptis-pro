class ChangeApplicationsToCandidaturas < ActiveRecord::Migration[5.1]
  def change
    rename_table :applications, :candidaturas
  end
end
