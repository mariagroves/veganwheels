class CreateWorkAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :work_areas do |t|
      t.string :postcode

      t.timestamps
    end
  end
end
