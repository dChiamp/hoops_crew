require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let (:event ) {Event.new({sat_vote:true, sun_votes:nill}) }

  it "is only valid with weekend_date" do
    expect(event.valid?) to be false
  end

  it "is only valid if sat_vote != nill && sun != nill " do 
    # maybe instead if sat_vote > 0 && sun_vote > 0
    expect(event.valid?).to be true
  end

end
