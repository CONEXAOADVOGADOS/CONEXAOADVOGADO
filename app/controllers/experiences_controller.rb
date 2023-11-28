class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update(experience_params)
    redirect_to experience_path(@experience)
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to experiences_path
  end

  def experience_params
    params.require(:experience).permit(:specialty, :category, :description, :date, :price, :local)
  end

  def search
    @experiences = Experience.where("category LIKE ?", "%#{params[:q]}%")
    render :index
  end

  # def my_experiences
  #   @experiences = Experience.where(user: current_user)
  # end

  # def my_appointments
  #   @appointments = Appointment.where(user: current_user)
  # end

    private

    def experience_params
      params.require(:experience).permit(:specialty, :category, :description, :date, :price, :local)
    end
  end
