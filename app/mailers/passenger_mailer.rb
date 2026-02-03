class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"

  def confirmation_email(emails)
    mail(to: emails, subject: "Booking Confirmation")
  end
end
