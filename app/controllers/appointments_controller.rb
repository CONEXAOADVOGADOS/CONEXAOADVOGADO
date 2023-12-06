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
    @appointment = @experience.appointments.new
  end

  def create
    @appointment = Appointment.create!(experience: @experience, experience_sku: @experience.sku, amount: @experience.price, state: "pending", user: current_user)
    # redirect_to appointments_path, notice: 'Appointment created successfully.'
    authorize @appointment

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @experience.sku,
        images: [@experience.photo_url],
        amount: @experience.price_cents,
        currency: 'usd',
        quantity: 1
      }],
      success_url: appointment_url(@appointment),
      cancel_url: appointment_url(@appointment)
    )

    @appointment.update(checkout_session_id: session.id)
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

  def set_event
    @experience = Experience.find(params[:experience_id])
  end

  def experience_params
    params.require(:appointment).permit(:specialty, :photos, :category, :description, :date, :price, :local, :photo)
  end
end
