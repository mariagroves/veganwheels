class Restaurant < ApplicationRecord
    # dependent: :destroy deletes all associated menu items if resto is deleted
    # https://guides.rubyonrails.org/active_record_validations.html
    has_one_attached :photo
    has_many :menu_items, dependent: :destroy
    has_many :sections
    belongs_to :admin_user
    validates :name, presence: true, uniqueness: true
    validates :address, presence: true
    validates :about, presence: true
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
end
