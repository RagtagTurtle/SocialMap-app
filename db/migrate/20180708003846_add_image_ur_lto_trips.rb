class AddImageUrLtoTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :bio, :text
    add_column :trips, :cover_image, :string
  end
end
