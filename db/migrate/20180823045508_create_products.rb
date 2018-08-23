class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.string :imgUrl
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
