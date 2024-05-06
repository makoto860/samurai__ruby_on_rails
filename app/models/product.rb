class Product < ApplicationRecord
  has_many :reviews
  has_many :reviews, dependent: :destroy
  def reviews_new
    reviews.new
  end
end
