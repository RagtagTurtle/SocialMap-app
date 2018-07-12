class AddLatitudeAndLongitudeToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :longitude, :float
    add_column :cities, :latitude, :float
  end
end
