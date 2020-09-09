class Restaurant < ApplicationRecord
    has_one_attached :photo
    has_many :menu_items, dependent: :destroy
    has_many :sections
    belongs_to :admin_user
    validates :name, presence: true
    validates :address, presence: true
    validates :about, presence: true
    # this messes with the seed, leave out for now
    # validates :photo, presence: true
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
end
