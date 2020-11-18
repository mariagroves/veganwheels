class RiderWorkArea < ApplicationRecord
  belongs_to :work_area
  belongs_to :rider_user
  validates :work_area, uniqueness: {scope: :rider_user}, on: :create
end
