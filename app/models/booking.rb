class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :start_date, :end_date, :people, presence: true


    mount_uploader :image, RoomImageUploader
end
