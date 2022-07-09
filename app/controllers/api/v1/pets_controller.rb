class Api::V1::PetsController < Api::V1::BaseController
  skip_before_action :verify_request, only: :index
  def index
    @pets = Pet.all.map{ |pet| pet.to_h }
    render json: @pets #Just for testing
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet.to_h
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = @current_user
    if @pet.save
      render json: @pet
      # render :show, status: :created
    else
      render_error
    end
  end

  def upload
    @pet = Pet.find(params[:id])
    if @pet.photo.attach(params.require(:file))
      render json: { msg: 'photo uploaded' }
    else
      render json: { err: 'fail to upload' }
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
