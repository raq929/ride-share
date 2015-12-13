class RidesController < OpenReadController
  def index
    render json: Ride.all
  end

  def show
    render json: Ride.where(params[:id])
  end

  def create
    @ride = current_user.rides.new(ride_params)

    if @ride.save
      render json: @ride, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ride.update(ride_params)
      render json: @ride
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @ride.destroy

    head :no_content
  end

  def ride_params
    params.require(:ride).permit(:owner, :length, :spots_left, :departure_date_time, :destination, :start_point, :event)
  end
end
