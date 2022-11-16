class AddUserIdToRentals < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM rentals;'
    add_reference :rentals, :user, null: false, index: true
  end

  def down
    remove_reference :rentals, :user, index: true
  end
end
