class ChangeOpeningTimeinRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :open_time
    remove_column :restaurants, :close_time
    add_column :restaurants, :monday_opens_at, :time
    add_column :restaurants, :tuesday_opens_at, :time
    add_column :restaurants, :wednesday_opens_at, :time
    add_column :restaurants, :thursday_opens_at, :time
    add_column :restaurants, :friday_opens_at, :time
    add_column :restaurants, :saturday_opens_at, :time
    add_column :restaurants, :sunday_opens_at, :time
    add_column :restaurants, :monday_closes_at, :time
    add_column :restaurants, :tuesday_closes_at, :time
    add_column :restaurants, :wednesday_closes_at, :time
    add_column :restaurants, :thursday_closes_at, :time
    add_column :restaurants, :friday_closes_at, :time
    add_column :restaurants, :saturday_closes_at, :time
    add_column :restaurants, :sunday_closes_at, :time
  end
end
