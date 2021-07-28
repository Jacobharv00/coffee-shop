class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, foreign_key: true, null: false
      t.belongs_to :coffee, foreign_key: true, null: false
      t.integer :price
    end
  end
end
