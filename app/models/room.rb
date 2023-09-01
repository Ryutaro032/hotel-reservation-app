class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_one_attached :room_image

    accepts_nested_attributes_for :reservations

    validates_associated :reservations

    validates :room_name,    presence: true
    validates :introduction, presence: true
    validates :hotel_fee,    presence: true
    validates :address,      presence: true

    validates :check_in_date,    presence: true
    validates :check_out_date,   presence: true
    validate :start_end_check
    validates :number_of_people, presence: true

    def start_end_check
        if self.check_in_date != nil && self.check_out_date != nil
            if self.check_in_date > self.check_out_date
                errors.add(:check_out_date, "は開始日より前の日付は登録できません。")
            end
        end
    end

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
