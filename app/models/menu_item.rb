class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :section
  has_many :menu_options, dependent: :destroy
end
