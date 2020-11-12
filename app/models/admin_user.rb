class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  has_one :restaurant, dependent: :restrict_with_error
  validates :phone, presence: true
  # validates :phone, telephone_number: {country: :GB, types: [:mobile]}

  def name
    "#{email}"
  end
end
