class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      
      t.date :check_in_date
      t.date :check_out_date
      t.integer :number_of_people
      t.integer :stay_days
      t.integer :total_amount

      t.timestamps
    end
  end
end
