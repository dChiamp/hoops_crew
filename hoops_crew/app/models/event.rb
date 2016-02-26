class Event < ActiveRecord::Base
  has_many :users

  validates :weekend_date, presence: true

  
end
