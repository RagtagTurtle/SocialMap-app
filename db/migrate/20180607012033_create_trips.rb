class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :climate
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
