class CarouselsController < ApplicationController
  def show
    @carousel_items = CarouselItem.all
  end
end

