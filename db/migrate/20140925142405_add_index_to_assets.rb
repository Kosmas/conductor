class AddIndexToAssets < ActiveRecord::Migration
  def change
    add_index :assets, :ticket_id
  end
end
