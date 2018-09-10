class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :country_code, limit: 2
      t.string :postal_code
      t.string :state
      t.timestamps
    end
  end
end
