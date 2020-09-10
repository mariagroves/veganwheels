class RemoveDefaultFromOrderPrice < ActiveRecord::Migration[6.0]
  def change
    change_column_default :orders, :delivery_price, nil
  end
end
