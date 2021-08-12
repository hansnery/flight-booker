class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @select_dates = Flight.all.map { |flight| [flight.datetime.strftime("%Y/%m/%d"), flight.datetime] }
    @airports = Airport.all
    @select_airports = Airport.all.map { |airport| [airport.city, airport.id] }
    if @search.present?
      @search.values.map do |n|
        flash.now[:alert] = "Invalid search!" if n.blank?
        return
      end
    end
  end

  # private

  # def flight_params
  #   params.require(:flight).permit(:from_id, :to_id, :datetime, :flight_duration)
  # end
end
