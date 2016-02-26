
# include EventsHelper
# need to get acces to EventsHelper Method

namespace :win do
  desc "send email" 
  task send_email: :environment do
    # ... set options if any
    
    # ApplicationMailer.send_final_date_email(@user).deliver_now
    # EventsHelper::p_time

    # test
    p "hi from email_rake"
  end
end