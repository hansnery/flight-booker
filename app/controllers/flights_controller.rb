class FlightsController < ApplicationController
  def index
    @search = params["search"]
    @select_dates = Flight.all.order(date: :asc).map { |flight| [flight.date, flight.date] }
    @select_dates = @select_dates.uniq
    @select_airports = Airport.all.map { |airport| [airport.city, airport.id] }
    if @search.present?
      @passengers = @search.values[2]
      @available_flights = Flight.where("from_id = :from_airport AND to_id = :to_airport AND date = :date", {from_airport: @search.values[0], to_airport: @search.values[1], date: @search.values[3]})
      @available_flights = @available_flights.order(time: :asc)
      @search.values.map do |param|
        if param.blank?
          @search = nil
          root_path
          flash.now[:alert] = "Invalid search! Make sure to select an option for every form." if param.blank?
        end
      end
    end
  end
end