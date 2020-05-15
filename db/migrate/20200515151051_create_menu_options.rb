class CreateMenuOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_options do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :menu_item, foreign_key: true

      t.timestamps
    end
  end
end
