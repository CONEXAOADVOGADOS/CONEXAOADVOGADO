class CreateLawyers < ActiveRecord::Migration[7.1]
  def change
    create_table :lawyers do |t|
      t.string :category
      t.string :lawyer_name
      t.string :description
      t.string :mail
      t.string :OAB
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
