class PaymentsController < ApplicationController
  def new
    @connection = current_user.connections.where(state: 'paid').find(params[:connection_id])
    authorize @connection
  end
end
