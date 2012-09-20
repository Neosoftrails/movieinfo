class CreateBollywoodReviews < ActiveRecord::Migration
  def change
    create_table :bollywood_reviews do |t|
      t.string :title
      t.string :mini_description
      t.text :description
      t.string :thumb_url
      t.string :image_url
      t.integer :rating
      t.string :data_url
      t.string :category

      t.timestamps
    end
  end
end
