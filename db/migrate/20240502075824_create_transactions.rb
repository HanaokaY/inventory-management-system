class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :product, null: false, foreign_key: true
      t.string :type
      t.integer :quantity
      t.datetime :transaction_date
      t.string :operator

      t.timestamps
    end
  end
end
