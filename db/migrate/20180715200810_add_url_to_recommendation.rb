class AddUrlToRecommendation < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :main_url, :string
  end
end
