class CreateCarouselItems < ActiveRecord::Migration[7.1]
  def change
    create_table :carousel_items do |t|
      t.string :title
      t.text :content
      t.string :image_url

      t.timestamps
    end
  end
end
