class AddLatLonToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :latitude, :float
    add_column :recommendations, :longitude, :float
  end
end
