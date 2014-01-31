class UserMailer < ActionMailer::Base
  default from: "fronnect@gmail.com"

  def rsvp_confirmation(attendee)
    @user = User.find(attendee.user_id)
    @event = Event.find(attendee.event_id)
    host = @event.user
    mail(:to => @user.email, :cc => host.email, :subject => "RSVP")
  end
end
