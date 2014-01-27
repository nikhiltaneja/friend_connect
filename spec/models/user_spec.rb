require 'spec_helper'

describe User do
  it "lists events with an rsvp" do
    user1 = User.create!( :email => "foo@bar.com",
                          :password => "foobar!!",
                          :password_confirmation => "foobar!!")
    
    event = Event.create!( :user_id => user1.id,
                            :title => "Football",
                            :venue => "Cleveland Browns Stadium",
                            :starts_at => "2014-04-26 12:00:00")
    
    user2 = User.create!(:email => "fizz@buzz.com",
                          :password => "fizzbuzz!!",
                          :password_confirmation => "fizzbuzz!!")
    
    event.attendees.create(:user_id => user2.id, :event_id => event.id)
    rsvps = user2.rsvps
    rsvps.should eq([event])
  end
end
