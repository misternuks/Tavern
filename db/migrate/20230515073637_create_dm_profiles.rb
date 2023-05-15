class CreateDmProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :dm_profiles do |t|
      t.integer :price
      t.string :experience
      t.string :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
