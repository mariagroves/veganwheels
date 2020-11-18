class WorkArea < ApplicationRecord
    validates :postcode, presence: true
    before_save :postcode_is_formatted
    geocoded_by :postcode
    after_validation :geocode

    def postcode_is_formatted
        unless self.latitude.present? && self.longitude.present?
            errors.add(:postcode, "Invalid postcode. Please make sure that the postcode includes a space, eg. 'G2 3AU'.")
        end
    end

    def name
        self.postcode
    end
end
