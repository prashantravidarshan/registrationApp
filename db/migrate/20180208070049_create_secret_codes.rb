class CreateSecretCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :secret_codes do |t|
      t.integer :user_id
      t.string :code
      t.string :email,              null: false, default: ""
      t.timestamps
    end
  end
end
