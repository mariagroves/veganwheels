class Restaurant < ApplicationRecord
  has_one_attached :photo
  has_many :menu_items, dependent: :restrict_with_error
  has_many :sections, dependent: :restrict_with_error
  has_many :orders, dependent: :restrict_with_error
  belongs_to :admin_user
  validates :phone, telephone_number: { country: :GB, types: [:mobile, :fixed_line] }
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validate :can_be_published
  before_save :postcode_is_formatted
  geocoded_by :address
  after_validation :geocode

  def is_currently_closed?
    self.before_opening_time? || self.after_closing_time? || self.is_closed_today? || !self.is_open
  end

  def is_closed_today?
    open_today = Time.now.strftime("%A").downcase + "_opens_at"
    close_today = Time.now.strftime("%A").downcase + "_closes_at"
    opens_at_time = self.send open_today
    closes_at_time = self.send close_today
    return opens_at_time == closes_at_time || opens_at_time.nil?
  end

  def before_opening_time?
    Time.now < self.opening_time_today
  end

  def after_closing_time?
    Time.now > self.closing_time_today
  end

  def opening_time_today
    opening_today = Time.now.strftime("%A").downcase + "_opens_at"
    opening_time_Y2K = self.send opening_today
    opening_time_hour_min = opening_time_Y2K.strftime("%I:%M %p")
    Time.parse opening_time_hour_min
  end

  def closing_time_today
    closing_today = Time.now.strftime("%A").downcase + "_closes_at"
    closing_time_Y2K = self.send closing_today
    closing_time_hour_min = closing_time_Y2K.strftime("%I:%M %p")
    Time.parse closing_time_hour_min
  end

  def address
    address = [street_address, city, county, postcode, country].reject { |e| e.to_s.empty? }
    address.join(", ")
  end

  def opening_hours
    days = [[monday_opens_at, monday_closes_at, "Monday"], [tuesday_opens_at, tuesday_closes_at, "Tuesday"], [wednesday_opens_at, wednesday_closes_at, "Wednesday"], [thursday_opens_at, thursday_closes_at, "Thursday"], [friday_opens_at, friday_closes_at, "Friday"], [saturday_opens_at, saturday_closes_at, "Saturday"], [sunday_opens_at, sunday_closes_at, "Sunday"]]

    hours = []

    days.each do |day|
      if day[0] == day[1] || day[0].nil?
        hours << "#{day[2]}: Closed"
      else
        hours << "#{day[2]}: #{day[0].strftime("%l:%M %p")} -#{day[1].strftime("%l:%M %p")}"
      end
    end
    hours.join(", ")
  end

  def postcode_is_formatted
    unless self.latitude.present? && self.longitude.present?
      errors.add(:postcode, "Invalid postcode. Please make sure that the postcode includes a space, eg. 'G2 3AU'.")
    end
  end

  def can_be_published
    # if !self.is_onboarded && self.is_published
    #     errors.add(:name, "The restaurant cannot be published on Vegan Wheels before it is fully onboarded with Stripe.")
    if !self.phone.present? && self.is_published
      errors.add(:phone, "Please add a phone number.")
    elsif !self.about.present? && self.is_published
      errors.add(:about, "Please add a description of the restaurant.")
    end
  end
end
