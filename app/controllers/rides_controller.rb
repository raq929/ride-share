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
        destination = Location.find_or_create_by!(address: ride_params[:destination][:address], 
          lat: ride_params[:destination][:lat], lng:ride_params[:destination][:lng])
        start_point = Location.find_or_create_by!(address: ride_params[:start_point][:address], 
          lat: ride_params[:start_point][:lat], lng:ride_params[:start_point][:lng])

        @ride = current_user.rides.new(length: ride_params[:length], 
          spots_left: ride_params[:spots_left], departure_date_time: ride_params[:departure_date_time], 
          event: ride_params[:event], destination: destination, start_point: start_point)
        @ride.save
      end
    rescue ActiveRecord::RecordInvalid => invalid
      p invalid.message
      render text: invalid.message, status: 400
    rescue Exception => e
      puts e.message
      p e.backtrace.inspect
      render text: e.message, status: 400
    else  
      render json: @ride, status: :created
    end
  end

  def update
    ride = Ride.find_by_id(params[:id])
    
    if ride.owner.id == current_user[:id]
      begin
        Ride.transaction do
          if ride_params[:destination]
            p ride_params[:address]
            destination = Location.find_or_create_by!(address: ride_params[:destination][:address], 
              lat: ride_params[:destination][:lat], lng:ride_params[:destination][:lng])
            ride.update!(destination: destination)
          else
            destination = ride.destination
          end
          if ride_params[:start_point]
             start_point = Location.find_or_create_by!(address: ride_params[:start_point][:address], lat: ride_params[:start_point][:lat], lng:ride_params[:start_point][:lng])
          else
            start_point = ride.start_point
          end
          ride.update!(length: ride_params[:length], spots_left: ride_params[:spots_left], departure_date_time: ride_params[:departure_date_time], event: ride_params[:event], destination: destination, start_point: start_point)
          end     
      rescue Exception => e
        puts e.message
        render text: e.message, status: 400
      else      
        render json: ride
      end
    else
      render json: {message: "You not authorized to update this ride"}, head: :unauthorized   
    end    
  end

  def destroy

    @ride = Ride.find_by_id(params[:id])
    if current_user.id != @ride.id
      render json: {message: "You not authorized to update this ride"}, head: :unauthorized 
    end
    if @ride.destroy
     render json: {message: 'Ride deleleted.'}
    else
      render json: {message: 'Ride was not successfully deleted'}, status: 401
    end
  end

  def ride_params
    params.require(:ride).permit(:id, :length, :spots_left, :departure_date_time, {destination: [:lat,:lng, :address]}, {start_point: [:lat,:lng, :address]}, :event)
  end
end
