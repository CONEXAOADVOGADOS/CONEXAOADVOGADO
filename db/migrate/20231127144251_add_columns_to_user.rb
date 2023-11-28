class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :phone, :string
  end
end
