class CreateTripVibes < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_vibes do |t|
      t.integer :trip_id
      t.integer :vibe_id

      t.timestamps
    end
  end
end
