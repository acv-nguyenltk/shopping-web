class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.json 'items', default: {}
      t.timestamps
    end
  end
end
