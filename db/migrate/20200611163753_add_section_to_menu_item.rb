class AddSectionToMenuItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :menu_items, :section
  end
end