class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @experiences = policy_scope(Experience)
    filters = {}
    filters[:category] = "%#{params[:category]}%" if params[:category].present?
    filters[:date] = Date.parse(params[:date]) if params[:date].present?
    filters[:local] = "%#{params[:location]}%" if params[:location].present?
    apply_filters(@experiences, filters)
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
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

  # def my_experiences
  # @experiences = Experience.where(user: current_user)
  # end

  # def my_appointments
  #   @appointments = Appointment.where(user: current_user)}
  # end

  private

  def apply_filters(scope, filters)
    filters.each do |key, value|
      case key
      when :category
        scope = scope.where("category ILIKE ?", value)
      when :date
        scope = scope.where(date: value)
      when :local
        scope = scope.where("local ILIKE ?", value)
      end
    end
    @experiences = scope
  end

  def experience_params
    params.require(:experience).permit(:specialty, :category, :description, :date, :price, :local, :photo)
  end

  def search
    @experiences = Experience.where("category LIKE ?", "%#{params[:q]}%")
    render :index
  end
end
