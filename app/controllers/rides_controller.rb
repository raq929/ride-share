class RidesController < OpenReadController
  def index
    render json: Ride.all
  end

  def show
    @ride = Ride.find_by_id(params[:id])
    render json: @ride, status: 200
  end

  def create
    begin
     Ride.transaction do
      destination = location.find_or_create_by!(address: ride_params[:address], lat: ride_params[:destination][:lat], lng:ride_params[:destination][:lng])
      start_point = location.find_or_create_by!(address: ride_params[:address], lat: ride_params[:destination][:lat], lng:ride_params[:destination][:lng])

      @ride = current_user.rides.new(length: ride_params[:length], spots_left: ride_params[:spots_left], departure_date_time: ride_params[:departure_date_time], event: ride_params[:event], destination: destination, start_point: start_point)
      @ride.save
      end
    rescue ActiveRecord::Invalid => invalid
      p invalid.message
      render text: invalid.message, status: 400
    rescue Exception => e
      puts e.message
      render text: e.message, status: 400
    else  
      render json: @ride, status: :created
    end
  end

  def update
    ride = Ride.find_by_id(params[:id])
    begin
      Ride.transaction do
        if ride_params[:destination]
          destination = location.find_or_create_by!(address: ride_params[:address], lat: ride_params[:destination][:lat], lng:ride_params[:destination][:lng])
          ride.update!(destination: destination)
        end
        if ride_params[:start_point]
           start_point = location.find_or_create_by!(address: ride_params[:address], lat: ride_params[:destination][:lat], lng:ride_params[:destination][:lng])
          ride.update!(start_point: start_point) 
        end
        ride.update(length: ride_params[:length], spots_left: ride_params[:spots_left], departure_date_time: ride_params[:departure_date_time], event: ride_params[:event])
        end     
    rescue Exception => e
      puts e.message
      render text: e.message, status: 400
    else      
      render json: @ride
    end
       
  end

  def destroy
    @ride = Ride.find_by_id(params[:id])
    @ride.destroy

    render json: {message: 'Ride deleleted.'}
  end

  def ride_params
    params.require(:ride).permit(:owner, :length, :spots_left, :departure_date_time, :destination, :start_point, :event, :address)
  end
end
