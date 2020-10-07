class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :order, null: false, foreign_key: true
      t.references :rider_user, null: false, foreign_key: true
      t.boolean :is_collected
      t.boolean :is_delivered
      t.datetime :time_collected
      t.datetime :time_delivered

      t.timestamps
    end
  end
end
