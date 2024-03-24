class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :category
      t.string :lawyer_name
      t.string :description
      t.string :mail
      t.integer :OAB
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
