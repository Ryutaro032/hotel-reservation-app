class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_one_attached :room_image

    validates :room_name,    presence: true
    validates :introduction, presence: true
    validates :hotel_fee,    presence: true
    validates :address,      presence: true

    def self.search(search)
        if search != ""
            Room.where('room_name LIKE (?) OR introduction LIKE (?)', "%#{search}%", "%#{search}%")
        else
            Room.all
        end
    end

    def self.area_search(search)
        if search != ""
            Room.where('address LIKE (?)', "%#{search}%")
        else
            Room.all
        end
    end

    def self.link_search(search)
        if search !=""
            Room.where('address LIKE (?)', "#{search}%")
        end
    end

end
