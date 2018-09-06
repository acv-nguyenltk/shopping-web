class ChangeModifiersInAddresses < ActiveRecord::Migration[5.2]
  def up
    change_table :addresses do |t|
      t.change :line1, :text
      t.change :line2, :text
      t.change :city, :text
      t.change :postal_code, :text
      t.change :state, :text
    end
  end

  def down
    change_table :products do |t|
      t.change :line1, :string
      t.change :line2, :string
      t.change :city, :string
      t.change :postal_code, :string
      t.change :state, :string
    end
  end
end
