class AddPhoneToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :phone, :string
  end
end
