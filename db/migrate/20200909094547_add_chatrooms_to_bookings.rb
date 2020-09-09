class AddChatroomsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :chatroom, null: false, foreign_key: true
  end
end
