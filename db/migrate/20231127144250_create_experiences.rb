class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :category
      t.string :specialty
      t.string :description
      t.string :local
      t.date :date
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
