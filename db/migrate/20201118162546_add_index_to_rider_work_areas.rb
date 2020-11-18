class AddIndexToRiderWorkAreas < ActiveRecord::Migration[6.0]
  def change
    add_index :rider_work_areas, [:rider_user_id, :work_area_id], unique: true
  end
end
