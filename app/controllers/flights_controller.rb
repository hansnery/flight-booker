class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @select_dates = Flight.all.map { |flight| [flight.datetime.strftime("%Y/%m/%d"), flight.datetime] }
    @airports = Airport.all
    @select_airports = Airport.all.map { |airport| [airport.city, airport.id] }
  end
end
