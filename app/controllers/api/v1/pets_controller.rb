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
end
