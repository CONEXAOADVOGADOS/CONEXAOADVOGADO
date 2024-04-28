class ConnectionsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def index
    @connections = policy_scope(Connection).where(user: current_user)
  end

  def show
    @connection = Connection.find(params[:id])
    authorize @connection
  end

  def new
    @connection = @lawyer.connections.new
  end

  def create
    lawyer = Lawyer.find(params[:lawyer_id])
    @connection = Connection.create!(lawyer:, amount: lawyer.price * 100, state: "paid", user: current_user)
    # redirect_to connections_path, notice: 'Connection created successfully.'
    authorize @connection
    create_session
    redirect_to new_connection_payment_path(@connection)
  end

  def edit
    @connection = Connection.find(params[:id])
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.update(connection_params)
    redirect_to connection_path(@connection)
    authorize @connection
  end

  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy
    redirect_to connections_path, notice: 'Connection deleted successfully.'
    authorize @connection
  end

  def search
    @connections = Connection.where("category LIKE ?", "%#{params[:q]}%")
    render :index
    authorize @connections
  end

  private

  def create_session # rubocop:disable Metrics/MethodLength
    session = Stripe::Checkout::Session.create(apn_method_types: ['card'],
      line_items: [{ # rubocop:disable Layout/HashAlignment,Layout/ArgumentAlignment
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
      mode: 'connection', # rubocop:disable Layout/ArgumentAlignment,Layout/HashAlignment
      success_url: connection_url(@connection), # rubocop:disable Layout/HashAlignment,Layout/ArgumentAlignment
      cancel_url: lawyer_url(@lawyer)) # rubocop:disable Layout/HashAlignment,Layout/ArgumentAlignment
    @connection.checkout_session_id = session.id
    @connection.save!
  end

  def set_event
    @lawyer = Lawyer.find(params[:lawyer_id])
  end

  def lawyer_params
    params.require(:connection).permit(:UF, :group, :city, :photos, :category, :detail, :OAB, :faculty, :status, :photo)
  end
end
