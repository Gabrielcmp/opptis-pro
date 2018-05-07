class AddRoleRules < ActiveRecord::Migration[5.1]
  def change
    add_reference :restaurants, :user, index: { unique: true }
    add_foreign_key :restaurants, :users

    add_reference :candidates, :user, index: { unique: true }
    add_foreign_key :candidates, :users
  end
end
