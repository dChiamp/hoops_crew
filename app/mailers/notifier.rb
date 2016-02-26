class Notifier < ApplicationMailer
  default from: 'no-reply@example.com',
          return_path: 'system@example.com'

  def final_date_email(user)
    @user = user
    # @event = event
    mail(to: user.email, subject: "hoops crew update")
  end
end
