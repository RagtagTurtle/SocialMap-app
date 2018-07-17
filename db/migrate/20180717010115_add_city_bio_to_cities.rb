class AddCityBioToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :bio, :text
  end
end
