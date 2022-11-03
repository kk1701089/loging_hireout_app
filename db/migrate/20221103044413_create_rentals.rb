class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :rent_room_name, null: false
      t.string :rent_room_intro, null: false
      t.datetime :rent_start_day, precision: nil
      t.datetime :rent_end_day, precision: nil
      t.integer :people, null: false
      t.integer :rent_room_charge, null: false

      t.timestamps
    end
  end
end
