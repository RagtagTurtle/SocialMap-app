class CreateGeographies < ActiveRecord::Migration[5.1]
  def change
    create_table :geographies do |t|
      t.string :name

      t.timestamps
    end
  end
end
