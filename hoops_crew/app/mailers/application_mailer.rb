class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'


  def final_date_email(user)
    @user = user
    # @event = event
    mail(to: user.email, subject: "hoops crew update")
  end
end
