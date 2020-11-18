class CreateRiderWorkAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :rider_work_areas do |t|
      t.references :work_area, null: false, foreign_key: true
      t.references :rider_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
