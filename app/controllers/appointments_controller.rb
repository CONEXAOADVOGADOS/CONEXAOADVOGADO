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
    @appointment = Appointment.create!(experience: @experience, user: current_user)
    redirect_to appointments_path, notice: 'Appointment created successfully.'
    authorize @appointment
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
end
