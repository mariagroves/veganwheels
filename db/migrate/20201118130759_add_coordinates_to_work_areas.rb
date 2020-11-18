class AddCoordinatesToWorkAreas < ActiveRecord::Migration[6.0]
  def change
    add_column :work_areas, :latitude, :float
    add_column :work_areas, :longitude, :float
  end
end
