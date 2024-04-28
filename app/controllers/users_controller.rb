class UsersController < ApplicationController
  include Pundit::Authorization

  def show
    @lawyers = Lawyer.where(user: current_user)
    @connections = Connection.all
  end

  def new
    @lawyer = Lawyer.new
    authorize @lawyer
  end

  def index
  end

  def create
    @lawyer = Lawyer.new(lawyer_params)
    @lawyer.user = current_user
    authorize @lawyer
    if @lawyer.save
      redirect_to lawyer_path(@lawyer)
    else
      render :new
    end
  end

  def edit
    @lawyer = Lawyer.find(params[:id])
    authorize @lawyer
  end

  def update
    @lawyer = Lawyer.find(params[:id])
    authorize @lawyer
    @lawyer.update(lawyer_params)
    redirect_to lawyer_path(@lawyer)
  end

  def destroy
    @lawyer = Lawyer.find(params[:id])
    authorize @lawyer
    @lawyer.destroy
    redirect_to lawyers_path
  end

  # def lawyer_params
  #   params.require(:lawyer).permit(:lawyerd_nameame, :category, :description, :date, :price, :local)
  # end

  # def my_lawyers
  # @lawyers = Lawyer.where(user: current_user)
  # end

  # def my_connections
  #   @connections = Connection.where(user: current_user)}
  # end

  private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end

  def lawyer_params
    params.require(:lawyer).permit(:UF, :city, :photos, :category, :detail, :OAB, :faculty, :group, :photo, :status)
  end

  def search
    @lawyers = Lawyer.where("category LIKE ?", "%#{params[:q]}%")
    render :index
  end
end
