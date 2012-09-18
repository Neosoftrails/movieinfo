class CreateBollywoodNews < ActiveRecord::Migration
  def change
    create_table :bollywood_news do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :data_url
      t.string :category

      t.timestamps
    end
  end
end
