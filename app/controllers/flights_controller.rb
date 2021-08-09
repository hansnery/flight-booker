class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @select_dates = Flight.all.map { |flight| [flight.datetime.strftime("%Y/%m/%d"), flight.datetime.strftime("%Y/%m/%d")] }
    @airports = Airport.all
    @select_airports = Airport.all.map { |airport| [airport.city, airport.airport_code, airport.id] }
  end
end
