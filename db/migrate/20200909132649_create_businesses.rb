class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.integer :delivery_price

      t.timestamps
    end
  end
end
