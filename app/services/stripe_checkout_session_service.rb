class StripeCheckoutSessionService
  def call(appointment)
    appointment = Appointment.find_by(checkout_session_id: appointment.data.object.id)
    appointment.update(state: 'paid')
  end
end
