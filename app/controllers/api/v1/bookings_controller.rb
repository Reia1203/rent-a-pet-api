class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @bookings = @current_user.bookings
    @pets = Pet.all
    render json: @bookings, include: [:pet]
  end

  def show
    @booking = Booking.find(params[:id])
    @pet = Pet.find(@booking.pet_id)
    render json: @booking, include: [:pet]
  end

  def create
    p "Starting"
    @booking = Booking.new
    @booking.user = @current_user
    p @booking.user
    @booking.pet = Pet.find(params[:pet_id])
    p @booking.pet
    @booking.status = "Pending"
    p "booking ready to save"
    if @booking.save
      render json: @booking, status: :created
    else
      render_error
    end
  end

  private


  def render_error
    render json: { errors: @pet.errors.full_messages },
      status: :unprocessable_entity
  end
end
