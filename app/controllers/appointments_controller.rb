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
    experience = Experience.find(params[:experience_id])
    @appointment = Appointment.create!(experience: experience, amount: experience.price * 100, state: "paid", user: current_user)
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
            name: @experience.category,
            description: @experience.description,
            images: [@experience.photo&.url],
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: appointment_url(@appointment),
      cancel_url: experience_url(@experience))
    @appointment.checkout_session_id = session.id
    @appointment.save!
  end

  def set_event
    @experience = Experience.find(params[:experience_id])
  end

  def experience_params
    params.require(:appointment).permit(:lawyer_name, :photos, :category, :description, :OAB, :telephone, :mail, :photo)
  end
end
