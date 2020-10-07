class AddDefaultsToDeliveries < ActiveRecord::Migration[6.0]
  def change
    change_column_default :deliveries, :is_collected, false
    change_column_default :deliveries, :is_delivered, false
  end
end
