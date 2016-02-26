class Event < ActiveRecord::Base
  has_many :users

  validates :weekend_date, presence: true

  include EventsHelper

  def self.final_date
  # if Event.sat_votes > Event.sun_votes
    p "Saturday wins!"
    # Event.final_date = "Saturday"
    # email
    # ApplicationMailer.final_date_email(@user).deliver!
  # else if self.sat_votes < self.sun_votes
    # p "Sunday wins!"
    # Event.final_date = "Sunday"
    #email sunday
    # end
  end

end
