class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :tea, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :title
      t.integer :price
      t.integer :frequency, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
