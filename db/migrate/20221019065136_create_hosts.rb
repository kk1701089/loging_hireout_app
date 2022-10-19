class CreateHosts < ActiveRecord::Migration[7.0]
  def change
    create_table :hosts do |t|
      t.string :room_name
      t.string :room_introduction
      t.integer :room_charge
      t.string :room_address

      t.timestamps
    end
  end
end
