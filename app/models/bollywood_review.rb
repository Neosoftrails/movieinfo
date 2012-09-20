class BollywoodReview < ActiveRecord::Base
  attr_accessible :category, :data_url, :description, :image_url, :mini_description, :rating, :thumb_url, :title
end
