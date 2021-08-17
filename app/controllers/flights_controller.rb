class FlightsController < ApplicationController
  def index
    @search = params["search"]
    @select_dates = Flight.all.order(datetime: :asc).map { |flight| [flight.datetime.strftime("%Y/%m/%d"), flight.datetime] }
    @select_airports = Airport.all.map { |airport| [airport.city, airport.id] }
    if @search.present?
      @available_flights = Flight.where("from_id = :from_airport AND to_id = :to_airport AND datetime = :datetime", {from_airport: @search.values[0], to_airport: @search.values[1], datetime: @search.values[3]})
      @search.values.map do |param|
        if param.blank?
          @search = nil
          root_path
          flash.now[:alert] = "Invalid search! Make sure to select an option for every form." if param.blank?
        end
      end
    end
  end

  # private

  # def flight_params
  #   params.require(:flight).permit(:from_id, :to_id, :datetime, :flight_duration)
  # end
end