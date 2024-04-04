class AddStatusToConnections < ActiveRecord::Migration[7.1]
  def change
    add_column :connections, :state, :string
  end
end
