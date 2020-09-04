class AddAdminUserRefToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :admin_user, foreign_key: true
  end
end
