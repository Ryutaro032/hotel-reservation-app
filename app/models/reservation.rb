class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room, optional: true

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
end
