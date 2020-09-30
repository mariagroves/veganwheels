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
        address = [street_address, city, county, postcode, country].reject { |e| e.to_s.empty? }
        address.join(', ')
    end

    def opening_hours
        days = [[monday_opens_at, monday_closes_at, "Monday"], [tuesday_opens_at, tuesday_closes_at, "Tuesday"], [wednesday_opens_at, wednesday_closes_at, "Wednesday"], [thursday_opens_at, thursday_closes_at, "Thursday"], [friday_opens_at, friday_closes_at, "Friday"], [saturday_opens_at, saturday_closes_at, "Saturday"], [sunday_opens_at,sunday_closes_at, "Sunday"]]
   
        hours = []

        days.each do |day|
            if day[0] == day [1] || day[0].nil?
                hours << "#{day[2]}: Closed"
            elsif day[2] == "Monday"
                hours << "#{day[2]}: #{monday_opens_at.strftime("%l:%M %p")} - #{monday_closes_at.strftime("%l:%M %p")}"
            elsif  day[2] == "Tuesday"
                hours << "#{day[2]}: #{tuesday_opens_at.strftime("%l:%M %p")} - #{tuesday_closes_at.strftime("%l:%M %p")}"
            elsif  day[2] == "Wednesday"
                hours << "#{day[2]}: #{wednesday_opens_at.strftime("%l:%M %p")} - #{wednesday_closes_at.strftime("%l:%M %p")}"
            elsif  day[2] == "Thursday"
                hours << "#{day[2]}: #{thursday_opens_at.strftime("%l:%M %p")} - #{thursday_closes_at.strftime("%l:%M %p")}"
            elsif  day[2] == "Friday"
                hours << "#{day[2]}: #{friday_opens_at.strftime("%l:%M %p")} - #{friday_closes_at.strftime("%l:%M %p")}"
            elsif  day[2] == "Saturday"
                hours << "#{day[2]}: #{saturday_opens_at.strftime("%l:%M %p")} - #{saturday_closes_at.strftime("%l:%M %p")}"
            elsif  day[2] == "Sunday"
                hours << "#{day[2]}: #{sunday_opens_at.strftime("%l:%M %p")} - #{sunday_closes_at.strftime("%l:%M %p")}"
            end
        end
        hours.join(', ')
    end

end
