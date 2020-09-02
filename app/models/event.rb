class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  has_many :bookings


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :reviews

end
