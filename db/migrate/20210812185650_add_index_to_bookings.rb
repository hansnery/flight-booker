class AddIndexToBookings < ActiveRecord::Migration[6.1]
  def change
    add_index :bookings, :flight_id
  end
end
