class AddCoverImageToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :cover_image, :string
  end
end
