class AddPriceToConnections < ActiveRecord::Migration[7.1]
  def change
    add_column :connections, :amount, :integer
  end
end
