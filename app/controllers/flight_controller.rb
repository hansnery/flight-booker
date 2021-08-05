class FlightController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all
    @select_airports = Airport.all.map { |airport| [airport.city, airport.airport_code, airport.id] }
  end

  # def search
  #   @search = params["search"]
  # end
end
