class AddIsSingleToMenuOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_options, :is_single, :boolean, default: :false
  end
end
