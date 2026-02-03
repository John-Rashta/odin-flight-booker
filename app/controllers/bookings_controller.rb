class BookingsController < ApplicationController
  def show
    @booking = Booking.includes(:passengers, :flight).find(params[:id])
  end

  def create
    current_params = create_params
    @booking = Booking.build(current_params)
    if @booking.save
      PassengerMailer.confirmation_email(@booking.passengers.pluck(:email)).deliver_now
      redirect_to @booking
    else
      redirect_to flights_path
    end
  end

  def new
    current_params = new_params
    @booking = Booking.new
    @flight = Flight.find(current_params[0])
    current_params[1].to_i.times { @booking.passengers.build }
  end

  private

  def create_params
    params.expect(booking: [ :flight_id,  passengers_attributes: [ [ :name, :email ] ] ])
  end

  def new_params
    params.expect(:flight_id, :num_of_passengers)
  end
end
