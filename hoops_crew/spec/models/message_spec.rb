require 'rails_helper'

RSpec.describe Message, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let (:message ) {Message.new({user_id: 2}) }
  it "is invalid without content" do 
    expect(message.valid?).to be false
  end

  it "must be shorter than 144 chars"
    expect(message.length).to be <= 144
  end

  it "must contain user_id" do
    expect(message.user_id?) to be true
  end

end
