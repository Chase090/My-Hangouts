class Changeusertoguest < ActiveRecord::Migration[5.1]
  def change
    rename_column :invitations, :user_id, :guest_id
  end
end
