module EventsHelper

  # doing this with whenever:
    # check time
    # if past fri 7pm, 
    # tally votes

  # helper
    # return winner here (tally)

  # action mailer
    # email?

    # else 

  # prob do this with whenver too 
    # create new Event

  # def final
  #   if @event.sat_votes > @event.sun_votes
  #     # email
  #     ApplicationMailer.final_date_email(@user).deliver!
  #   else if @event.sat_votes < @event.sun_votes
  #     #email sunday
  #   end
  # end

  def sanity_check
    p "hello from EventsHelper"
  end
  
end
