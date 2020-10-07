class AddRoleToRiderUser < ActiveRecord::Migration[6.0]
  def change
    add_column :rider_users, :role, :string, null: false, default: 'rider'
  end
end
