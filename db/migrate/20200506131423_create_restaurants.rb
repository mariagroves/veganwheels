class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.integer :open_time
      t.integer :close_time
      t.text :about
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
