class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :source, null: false
      t.references :destination, null: false
      t.float :amount, null: false

      t.timestamps
    end
  end
end
