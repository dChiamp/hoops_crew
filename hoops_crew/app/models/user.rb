class User < ActiveRecord::Base
  #relationships
  has_many :messages
  has_many :events
  has_secure_password

  # validations
  validates :name, :email, :password, presence: true


  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  # make hella validations
end
