class Api::V1::PetsController < Api::V1::BaseController
  skip_before_action :verify_request, only: :index
  def index
    @pets = Pet.all
    render json: @pets #Just for testing
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = @current_user
    if @pet.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :bio, :species, :photo)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages },
      status: :unprocessable_entity
  end
end
