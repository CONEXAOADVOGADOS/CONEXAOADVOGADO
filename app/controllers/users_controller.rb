class UsersController < ApplicationController
  include Pundit::Authorization

  def show
    @experiences = Experience.where(user: current_user)
    @appointments = Appointment.all
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    authorize @experience
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def update
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.update(experience_params)
    redirect_to experience_path(@experience)
  end

  def destroy
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.destroy
    redirect_to experiences_path
  end

  # def experience_params
  #   params.require(:experience).permit(:specialty, :category, :description, :date, :price, :local)
  # end

  # def my_experiences
  # @experiences = Experience.where(user: current_user)
  # end

  # def my_appointments
  #   @appointments = Appointment.where(user: current_user)}
  # end

  private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end

  def experience_params
    params.require(:experience).permit(:specialty, :category, :description, :date, :price, :local)
  end

  def search
    @experiences = Experience.where("category LIKE ?", "%#{params[:q]}%")
    render :index
  end
end
