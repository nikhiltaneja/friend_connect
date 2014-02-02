require 'spec_helper'

describe "creating an event" do
  before :each do
    @user = User.create(:email => "foo@bar.com",
                        :password => "foobar!!",
                        :password_confirmation => "foobar!!")
  end

  it 'does not allow guest to create event' do
    visit new_event_path
    expect(page).to have_content 'You need to sign in'
  end

  it 'allows logged in user to create an event', js: true do
    # sign in the user
    visit new_user_session_path
    fill_in 'Email', with: 'foo@bar.com'
    fill_in 'Password', with: 'foobar!!'
    click_on 'Sign in'
    expect(page).to have_content 'Signed in'

    visit new_event_path
    fill_in 'Title',       with: 'Big thing'
    fill_in 'Description', with: 'it is indeed'
    fill_in 'Venue',       with: 'my house'
    fill_in 'Address',     with: 'down the street'
    find(".date_calendar").click
    find('.ui-datepicker-next').click
    click_link('10')
    within('.actions') do
      click_on 'Create Event'
    end
    expect(page).to have_content 'Big thing'
  end

  it 'sends an email to host and attendee' do
    User.create(email: 'nikhil@example.com', password: 'password', password_confirmation: 'password')
    Event.create(user_id: @user.id, title: 'Super Bowl', venue: "Nikhil's Apartment", starts_at: "2014-02-14 07:00:00")
    visit new_user_session_path
    fill_in 'Email', with: 'nikhil@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    visit root_path
    click_on("I'm in!")
    assert_equal 1, ActionMailer::Base.deliveries.count
  end
end
