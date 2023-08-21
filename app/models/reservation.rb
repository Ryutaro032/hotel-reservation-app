class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    def length_stay
        check_in_date  = Date.new(:check_in_date)
        check_out_date = Date.new(:check_out_date)

        date_difference = check_out_date - check_in_date

        puts date_difference

        return date_difference
    end

    # def total
    #     total_amount = :hotel_fee * :number_of_people * length_stay
    # end
end
