class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_image
      t.string :room_name
      t.text :introduction
      t.integer :hotel_fee
      t.string :address

      t.timestamps
    end
  end
end
