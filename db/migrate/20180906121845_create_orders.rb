class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phoneNumber
      t.string :shipping_address
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :note
      t.json :date_order, default: {}
      t.timestamps
    end
  end
end
