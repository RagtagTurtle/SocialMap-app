class AddIconUrlToRecommendation < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :icon_image, :string
  end
end
