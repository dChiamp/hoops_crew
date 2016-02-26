class User < ActiveRecord::Base
  #relationships
  include EventsHelper

  has_many :messages
  has_many :events
  has_secure_password

  # validations
  validates :name, :email, :password, presence: true


  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  def self.sanity_check
    # event_check
    p "hey from User model!"
  end

  # def send_final_date_email
  #   ApplicationMailer.final_date_email(self)deliver!
  # end
  # make hella validations
end
