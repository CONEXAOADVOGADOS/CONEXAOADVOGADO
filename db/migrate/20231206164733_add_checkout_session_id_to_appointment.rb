class AddCheckoutSessionIdToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :checkout_session_id, :string
  end
end
