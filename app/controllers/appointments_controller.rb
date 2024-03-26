class AppointmentsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def index
    @appointments = policy_scope(Appointment).where(user: current_user)
  end

  def show
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def new
    @appointment = @lawyer.appointments.new
  end

  def create
    lawyer = Lawyer.find(params[:lawyer_id])
    @appointment = Appointment.create!(lawyer: lawyer, amount: lawyer.price * 100, state: "paid", user: current_user)
    # redirect_to appointments_path, notice: 'Appointment created successfully.'
    authorize @appointment
    create_session
    redirect_to new_appointment_payment_path(@appointment)
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
    authorize @appointment
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, notice: 'Appointment deleted successfully.'
    authorize @appointment
  end

  def search
    @appointments = Appointment.where("category LIKE ?", "%#{params[:q]}%")
    render :index
    authorize @appointments
  end

  private

  def create_session
    session = Stripe::Checkout::Session.create(payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          unit_amount: @appointment.amount,
          product_data: {
            name: @lawyer.category,
            description: @lawyer.description,
            images: [@lawyer.photo&.url],
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: appointment_url(@appointment),
      cancel_url: lawyer_url(@lawyer))
    @appointment.checkout_session_id = session.id
    @appointment.save!
  end

  def set_event
    @lawyer = Lawyer.find(params[:lawyer_id])
  end

  def lawyer_params
    params.require(:appointment).permit(:lawyer_name, :photos, :category, :description, :OAB, :telephone, :mail, :photo)
  end
end
