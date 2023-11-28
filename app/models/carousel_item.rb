class CarouselItem < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :image_url, presence: true
end
