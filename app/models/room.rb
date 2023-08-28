class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_one_attached :room_image

    def self.search(search)
        if search != ""
            Room.where('room_name LIKE (?) OR introduction LIKE (?)', "%#{search}%", "%#{search}%")
        # binding.pry
        else
            Room.all
        # binding.pry
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
        @room = Room.where('address LIKE (?)', "#{search}%")
        # binding.pry
        end
    end

end
