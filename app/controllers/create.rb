session = Stripe::Checkout::Session.create(
  connection_method_types: ['card'],
  line_items: [{
    price_data: {
      currency: 'usd',
      unit_amount: @connection.amount,
      product_data: {
        name: @lawyer.category,
        description: @lawyer.description,
        images: [@lawyer.photo&.url]
      }
    },
    quantity: 1
  }],
  mode: 'payment',
  success_url: connection_url(@connection),
  cancel_url: connection_url(@connection)
)
@connection.update(checkout_session_id: session.id)
redirect_to new_connection_connection_path(@connection)
