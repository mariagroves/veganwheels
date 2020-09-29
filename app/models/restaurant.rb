class Restaurant < ApplicationRecord
    has_one_attached :photo
    has_many :menu_items, dependent: :destroy
    has_many :sections
    has_many :orders
    belongs_to :admin_user
    validates :name, presence: true
    validates :street_address, presence: true
    validates :city, presence: true
    validates :postcode, presence: true
    validates :about, presence: true
    # this messes with the seed, leave out for now
    # validates :photo, presence: true
    geocoded_by :address
    after_validation :geocode

    def address
        [street_address, city, county, postcode, country].compact.join(', ')
    end

end
