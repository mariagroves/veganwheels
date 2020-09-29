class AddCountryToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :country, :string, default: "United Kingdom"
  end
end
