class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_options, dependent: :destroy
end
