class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :game_type
      t.date :date
      t.integer :session_hours
      t.integer :player_number
      t.string :details
      t.references :dm_profile, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
