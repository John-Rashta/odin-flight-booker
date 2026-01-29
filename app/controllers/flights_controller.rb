class FlightsController < ApplicationController
  def index
    filtered_params = index_params if params[:start_time].presence
    @found_flights = Flight.where(
      departure_airport_id: filtered_params[0],
      arrival_airport_id: filtered_params[1],
      start_time: filtered_params[3].all_day
    ) if filtered_params
    @all_airports = Airport.pluck(:code, :id)
    @all_dates = Flight.group("date(start_time)").distinct.order("date(start_time)")
    @num_of_passengers = filtered_params[2] if filtered_params
  end

  private

  def index_params
    filtered_params = params.expect(:departure_airport, :arrival_airport, :num_of_passengers, :start_time)
    filtered_params[3] = Time.at(filtered_params[3].to_i).to_datetime
    filtered_params
  end
end
