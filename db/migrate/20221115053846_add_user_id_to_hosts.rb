class AddUserIdToHosts < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM hosts;'
    add_reference :hosts, :user, null: false, index: true
  end

  def down
    remove_reference :hosts, :user, index: true
  end
end
