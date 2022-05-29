class AddImageToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :image, :string
  end
end
