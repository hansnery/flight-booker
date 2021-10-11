class PassengerMailer < ApplicationMailer
  default from: 'odinflightbooker@gmail.com'

  def thank_you_email(passenger, flight, booking)
    @passenger = passenger
    @flight = flight
    @booking = booking
    @url  = 'http://localhost:5000/users/sign_in'
    mail(from: 'odinflightbooker@gmail.com', to: passenger.email, subject: 'Flight Successfully Booked')
  end
  # def thank_you_email
  #   @booking = params[:booking]
    
  #   @url  = 'http://localhost:5000/users/sign_in'

  #   @booking.passengers.each do |passenger|
  #     @passenger = passenger
  #     mail(to: passenger.email, subject: "Flight Successfully Booked")
  #   end
  #   # mail(to: 'hansnery@gmail.com', subject: 'Flight Successfully Booked')
  # end
end
