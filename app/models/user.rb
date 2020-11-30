class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :phone, telephone_number: {country: :GB, types: [:mobile]}
  # validates :password, password_strength: {min_entropy: 10}
  validates :street_address, presence: true 
  validates :city, presence: true 
  validate :location_is_glasgow
  validates :postcode, presence: true 
  validate :address_is_correct
  has_many :orders, dependent: :destroy
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    "#{first_name}" + " #{last_name}"
  end

  def address
    address = [street_address, city, county, postcode, country].reject { |e| e.to_s.empty? }
    address.join(', ')
  end

  def location_is_glasgow
    unless self.postcode.match?(/\A(g|G)/)
      errors.add(:postcode, "Vegan Wheels is currently only available in Glasgow.")
    end
  end

  def is_outside_delivery_area(restaurant)
    restaurant.distance_from(Geocoder.search(self.address).first.coordinates, :km) > 5
  end

  private

  def send_welcome_email
    WelcomeEmailWorker.perform_async(self.id)
  end

  def address_is_correct
    if Geocoder.search(self.address).empty?
        errors.add(:postcode, "Invalid address. Please make sure there are no errors and that the postcode includes a space, eg. 'G2 3AU'.")
    end
  end
end
