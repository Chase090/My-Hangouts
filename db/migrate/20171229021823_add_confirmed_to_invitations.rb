class AddConfirmedToInvitations < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :confirmed, :boolean
  end
end
