class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  include Pundit::Authorization
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @experiences = policy_scope(Experience)

    filters = {}

    if params[:category].present?
      filters[:category] = "%#{params[:category]}%"
      # @experiences = @experiences.where("category ILIKE ?", "%#{params[:category]}%")
    end

    if params[:date].present?
      begin
        date = Date.parse(params[:date])
        filters[:date] = date
        # @experiences = @experiences.where(date: date)
      rescue ArgumentError
        flash.now[:alert] = "Invalid date format. Please use DD-MM-YYYY"
      end
    end

    if params[:location].present?
      filters[:local] = "%#{params[:location]}%"
      # @experiences = @experiences.where("local ILIKE ?", "%#{params[:location]}%")
    end

    @experiences = apply_filters(@experiences, filters)
  end

    # @experiences = Experience.all
    # params[:category].present?
    #   @experiences = @experiences.where("category ILIKE ?", "%#{params[:category]}%")
    # end
    # params[:date].present?
    #   @experiences = @experiences.where(date: Date.parse(params[:date]))
    # @experiences = Experience.joins(:category, :date, :local)

    # @experiences = @experiences.where("category ILIKE ?", "%#{params[:category]}%") if params[:category].present?
    # @experiences = @experiences.where(date: Date.parse(params[:date])) if params[:date].present?
    # @experiences = @experiences.where("local ILIKE ?", "%#{params[:location]}%")

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

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

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
    scope
  end

  def experience_params
    params.require(:experience).permit(:specialty, :category, :description, :date, :price, :local, :photo)
  end

  def search
    @experiences = Experience.where("category LIKE ?", "%#{params[:q]}%")
    render :index
  end
end
