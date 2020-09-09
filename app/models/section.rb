class Section < ApplicationRecord
    has_many :menu_items, dependent: :restrict_with_error
    belongs_to :restaurant
    validates :name, :order, presence: true
    validates :order, uniqueness: {scope: :restaurant}, on: :create
end
