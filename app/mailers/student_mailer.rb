class StudentMailer < ActionMailer::Base
  default from: "from@example.com"

  def csv_mail(email_address)
    mail(to: email_address, subject: 'Welcome to My Awesome Site')
  end
end
