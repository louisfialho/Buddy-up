class Booking < ApplicationRecord
  belongs_to :participant, class_name: "User"
  belongs_to :event

  belongs_to :chatroom
end
