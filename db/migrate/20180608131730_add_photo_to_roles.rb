class AddPhotoToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :photo, :string

    add_column :candidates,  :photo, :string
  end
end
