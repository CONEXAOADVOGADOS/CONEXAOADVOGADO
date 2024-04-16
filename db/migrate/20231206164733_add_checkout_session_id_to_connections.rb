class AddCheckoutSessionIdToConnections < ActiveRecord::Migration[7.1]
  def change
    add_column :connections, :checkout_session_id, :string
  end
end
