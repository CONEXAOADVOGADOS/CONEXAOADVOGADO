# class StripeCheckoutSessionService
#   def call(connection)
#     connection = Connection.find_by(checkout_session_id: connection.data.object.id)
#     connection.update(state: 'paid')
#   end
# end
