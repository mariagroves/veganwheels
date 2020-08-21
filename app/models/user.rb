class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, length: { is: 11 }, presence: true 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
