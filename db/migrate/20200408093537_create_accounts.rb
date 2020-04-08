class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, id: false do |t|
      t.string :id, null: false, primary_key: true, unique: true
      t.string :username, null: false
      t.string :password_digest, null: false
      t.float :balance, default: 0

      t.timestamps
    end
  end
end
