class ChangePhoneToStringInRestaurants < ActiveRecord::Migration[6.0]
  def change
    change_column :restaurants, :phone, :string
  end
end
