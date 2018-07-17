class RemovePaperclipColumnsFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :image_file_name, :string
    remove_column :trips, :image_content_type, :string
    remove_column :trips, :image_file_size, :string
    remove_column :trips, :image_updated_at, :string
  end
end
