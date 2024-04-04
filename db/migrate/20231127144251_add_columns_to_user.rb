class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :CPF, :string
    add_column :users, :phone_number, :string
  end
end
