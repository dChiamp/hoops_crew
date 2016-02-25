
# include EventsHelper
# need to get acces to EventsHelper Method

namespace :win do
  desc "send email" 
  task send_email: :environment do
    # ... set options if any
    # UserMailer.digest_email_update(options).deliver!
    # EventsHelper::p_time

    # test
    p "hi from email_rake"
  end
end