session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [{
    price_data: {
      currency: 'usd',
      unit_amount: @appointment.amount,
      product_data: {
        name: @lawyer.category,
        description: @lawyer.description,
        images: [@lawyer.photo&.url]
      }
    },
    quantity: 1
  }],
  mode: 'payment',
  success_url: appointment_url(@appointment),
  cancel_url: appointment_url(@appointment)
)
@appointment.update(checkout_session_id: session.id)
redirect_to new_appointment_payment_path(@appointment)
