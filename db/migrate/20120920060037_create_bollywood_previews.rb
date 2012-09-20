class CreateBollywoodPreviews < ActiveRecord::Migration
  def change
    create_table :bollywood_previews do |t|
      t.string :title
      t.text :description
      t.string :data_url
      t.string :image_url
      t.string :category

      t.timestamps
    end
  end
end
