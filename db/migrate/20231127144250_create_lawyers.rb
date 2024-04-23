class CreateLawyers < ActiveRecord::Migration[7.1]
  def change
    create_table :lawyers do |t|
      t.string :state
      t.string :city
      t.string :OAB
      t.string :type
      t.string :category
      t.string :faculty
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
