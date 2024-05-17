class ConnectionsController < ApplicationController
  before_action :set_connection, only: %i[show edit update destroy]
  before_action :set_lawyer, only: %i[new create]

  def index
    @connections = policy_scope(Connection).where(user: current_user)
  end

  def show
    authorize @connection
  end

  def new
    @connection = @lawyer.connections.new
  end

  def create
    @connection = @lawyer.connections.new(connection_params)
    @connection.user = current_user
    @connection.amount = @lawyer.price * 100
    @connection.state = "paid"

    if @connection.save
      authorize @connection
      create_session
      redirect_to new_connection_payment_path(@connection)
    else
      Rails.logger.error("Failed to create connection: #{@connection.errors.full_messages.join(", ")}")
      render json: { error: "Failed to create connection" }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    authorize @connection
    if @connection.update(connection_params)
      redirect_to connection_path(@connection), notice: 'Connection updated successfully.'
    else
      Rails.logger.error("Failed to update connection: #{@connection.errors.full_messages.join(", ")}")
      render json: { error: "Failed to update connection" }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @connection
    @connection.destroy
    redirect_to connections_path, notice: 'Connection deleted successfully.'
  end

  def search
    @connections = policy_scope(Connection).where("category LIKE ?", "%#{params[:q]}%")
    authorize @connections
    render :index
  end

  private

  def create_session
    session = Stripe::Checkout::Session.create(payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          unit_amount: @connection.amount,
          product_data: {
            name: @connection.lawyer.category,
            description: @connection.lawyer.description,
            images: [@connection.lawyer.photo&.url]
          }
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: connection_url(@connection),
      cancel_url: lawyer_url(@connection.lawyer))
    @connection.update!(checkout_session_id: session.id)
  end

  def set_connection
    @connection = Connection.find(params[:id])
  end

  def set_lawyer
    @lawyer = Lawyer.find(params[:lawyer_id])
  end

  def connection_params
    params.require(:connection).permit(:UF, :group, :city, :photos, :category, :detail, :OAB, :faculty, :status, :photo)
  end
end
