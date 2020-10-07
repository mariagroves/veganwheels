class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :street_address, presence: true 
  validates :city, presence: true 
  validates :postcode, presence: true 
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    "#{first_name}" + " #{last_name}"
  end

  def address
    address = [street_address, city, county, postcode, country].reject { |e| e.to_s.empty? }
    address.join(', ')
  end
end
