# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def thank_you_email
    @booking = Booking.new(id: 327, flight_id: 6427)

    PassengerMailer.with(booking: @booking).thank_you_email
  end
end
