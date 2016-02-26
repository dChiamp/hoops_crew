require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let (:user) {User.create({name: "foo", email: "d@c.com"}) }
  
  it "is invalid without password" do 
    p user.password
    expect(user.valid?).to be false
  end

  it "is invalid without name" do 
    expect(user.name?).to be true
  end

  it "must be real email" do 
    expect(user.email?).to contain /\A(\S+)@(.+)\.(\S+)\z/
  end

  it "must be unique email"
    expect(user.email).to be unique
  end

  let (:correct_user) {User.create({name: "foo", password: "123", email: "d@c.com"}) }

  it "is valid with password" do 
    p user.password
    expect(correct_user.valid?).to be true
  end

end
