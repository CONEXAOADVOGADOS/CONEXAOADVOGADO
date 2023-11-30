class AppointmentsController < ApplicationController
  before_action :set_event, only: %i[new create]
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = @experience.appointments.new
  end

  def create
    @appointment = Appointment.create!(experience: @experience, user: current_user)
    redirect_to user_path(current_user), notice: 'Appointment created successfully.'
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to experience_appointment_path, notice: 'Appointment deleted successfully.'
  end

  def search
    @appointments = Appointment.where("category LIKE ?", "%#{params[:q]}%")
    render :index
  end

  private

  def set_event
    @experience = Experience.find(params[:experience_id])
  end


end
