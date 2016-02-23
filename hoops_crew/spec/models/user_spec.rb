require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let (:user) {User.create({name: "foo"}) }
  it "is invalid without password" do 
    expect(user.password_digest?).to be true
  end

  it "is invalid without name" do 
    expect(user.name?).to be true
  end

  # it "must be real email" do 
  #   expect(user.email?).to contain /\A(\S+)@(.+)\.(\S+)\z/
  # end

  # it "must be unique email"
  #   expect(user.email).to be unique
  # end


end
