class ChangeConfirmedDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:invitations, :confirmed, false)
  end
end
