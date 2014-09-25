class AddIndexesToPermissions < ActiveRecord::Migration
  def change
    add_index :permissions, :user_id
    add_index :permissions, [:thing_id, :thing_type]
  end
end
