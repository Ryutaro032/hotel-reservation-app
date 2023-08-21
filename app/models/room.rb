class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_one_attached :room_image
end
