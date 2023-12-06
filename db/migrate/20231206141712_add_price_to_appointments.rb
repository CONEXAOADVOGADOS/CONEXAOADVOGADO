class AddPriceToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_monetize :experiences, :price, currency: { present: false }
    add_monetize :appointments, :amount, currency: { present: false }
  end
end
