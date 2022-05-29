class AddIntroToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :room_intro, :text
  end
end
