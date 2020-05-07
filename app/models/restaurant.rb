class Restaurant < ApplicationRecord
    # dependent: :destroy deletes all associated menu items if resto is deleted
    # https://guides.rubyonrails.org/active_record_validations.html
    has_many :menu_items, dependent: :destroy
    # validates :name, presence: true
    # validates :address, presentece: true
end
