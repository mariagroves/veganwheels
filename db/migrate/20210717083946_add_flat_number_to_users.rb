class AddFlatNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :flat, :string
  end
end
