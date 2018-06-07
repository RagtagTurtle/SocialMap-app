class CreateTripActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_activities do |t|
      t.integer :trip_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
