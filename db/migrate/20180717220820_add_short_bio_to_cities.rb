class AddShortBioToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :short_bio, :text
  end
end
