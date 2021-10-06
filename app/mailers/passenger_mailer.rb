class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def thank_you_email(passenger, flight, booking)
    @passenger = passenger
    @flight = flight
    @booking = booking
    @url  = 'http://localhost:5000/users/sign_in'
    mail(to: passenger.email, subject: 'Welcome to My Awesome Site')
  end
end
