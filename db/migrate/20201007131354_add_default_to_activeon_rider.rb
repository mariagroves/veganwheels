class AddDefaultToActiveonRider < ActiveRecord::Migration[6.0]
  def change
    change_column_default :rider_users, :is_active, true
  end
end
