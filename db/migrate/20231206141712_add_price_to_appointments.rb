class AddPriceToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :amount, :integer
  end
end
