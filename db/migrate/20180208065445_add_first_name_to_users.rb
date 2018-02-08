class AddFirstNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :code, :string
    add_column :users, :role, :string, default: "member"
  end
end
