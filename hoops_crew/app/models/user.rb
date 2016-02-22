class User < ActiveRecord::Base
  has_many :messages
  has_many :events
  has_secure_password
end
