class AddPreviousStateToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :previous_state, index: true, foreign_key: true
  end
end
