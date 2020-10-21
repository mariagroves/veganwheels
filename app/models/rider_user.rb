class RiderUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deliveries, dependent: :restrict_with_error
  validate :rider_is_active

  def name
    "#{first_name}" + " #{last_name}"
  end

  def rider_is_active
    if !self.is_active && self.is_available
      # error should be added to :is_available but there is a bug in the form which disables the checkbox after the error is added
      errors.add(:first_name, "Change the rider's active status on VeganWheels in order to change their availability to work.")
    end
  end
  
end
