class CreateHangouts < ActiveRecord::Migration[5.1]
  def change
    create_table :hangouts do |t|
      t.string :title
      t.string :location
      t.string :date
      t.string :notes
      t.string :date_options
      t.string :location_options
      t.string :draft_notes
      t.boolean :confirmed
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
