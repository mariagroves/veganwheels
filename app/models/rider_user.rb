class RiderUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deliveries, dependent: :restrict_with_error
  has_many :rider_work_areas, dependent: :destroy
  has_many :work_areas, through: :rider_work_areas
  validates :phone, telephone_number: {country: :GB, types: [:mobile]}
  validate :rider_is_active
  validate :rider_has_work_area

  def name
    "#{first_name.capitalize}" + " #{last_name.capitalize}"
  end

  def rider_is_active
    if !self.is_active && self.is_available
      # error should be added to :is_available but there is a bug in the form which disables the checkbox after the error is added
      errors.add(:first_name, "Change the rider's active status on VeganWheels in order to change their availability to work.")
    end
  end

  def rider_has_work_area
    if self.is_available && self.rider_work_areas.empty?
      errors.add(:first_name, "Create at least one work area for this rider in order to make them available to work.")
    end
  end
  
end
