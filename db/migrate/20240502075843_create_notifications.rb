class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :product, null: false, foreign_key: true
      t.text :message
      t.string :status
      t.datetime :notification_date

      t.timestamps
    end
  end
end
