class CreateBollywoodTrailers < ActiveRecord::Migration
  def change
    create_table :bollywood_trailers do |t|
      t.string :title
      t.string :description
      t.string :thumb_url
      t.string :data_url
      t.string :video_url
      t.string :category

      t.timestamps
    end
  end
end
