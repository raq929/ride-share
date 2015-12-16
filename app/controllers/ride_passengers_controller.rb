# == Schema Information
#
# Table name: ride_passengers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  ride_id    :integer          not null
#


class RidePassengersController < OpenReadController
  def index
    render json: RidePassenger.all
  end

  def create
    ride = Ride.find_by_id(ride_passengers_params[:ride_id])
    if ride.spots_available > ride.passengers.length && current_user.id != ride.owner.id
      passenger = RidePassenger.create(user_id: current_user.id, ride_id: ride_passengers_params[:ride_id])
      if passenger.save
        render json: passenger, status: 201
      end   
    else
      render json: {message: 'You were not successfully added as a passenger.'}, status: 401
    end
  end

  def destroy
    ride_passenger = RidePassenger.find_by(user_id: current_user.id, ride_id: ride_passengers_params[:ride_id])
    p current_user.id
    p ride_passenger.id
    if (current_user.id == ride_passenger.user.id) && ride_passenger.destroy
      render json: {message: 'You are no longer a passenger'}
    else
      render json: {message: 'Passenger was not successfully deleted.'}, status: 401
    end
  end

  def ride_passengers_params
    params.permit(:ride_id)
  end
end
