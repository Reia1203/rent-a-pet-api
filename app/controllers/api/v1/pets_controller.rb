class Api::V1::PetsController < Api::V1::BaseController
  def index
    @pets = Pet.all
    render json: @pets #Just for testing
  end
end
