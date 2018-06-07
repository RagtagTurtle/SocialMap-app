class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.integer :category
      t.string :name
      t.integer :trip_id
      t.integer :city_id

      t.timestamps
    end
  end
end
