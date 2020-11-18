class RiderWorkArea < ApplicationRecord
  belongs_to :work_area
  belongs_to :rider_user
end
