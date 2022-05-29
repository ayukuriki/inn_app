class Room < ApplicationRecord
    belongs_to :user
    has_many :bookings

    validates :name, :address, :introduction, :price, presence: true


    mount_uploader :image, RoomImageUploader
    
end
