class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.integer :geography_id
      t.string :name
      t.string :state
      t.string :region

      t.timestamps
    end
  end
end
