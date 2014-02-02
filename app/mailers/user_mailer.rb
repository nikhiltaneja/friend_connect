class UserMailer < ActionMailer::Base
  default from: "fronnect@gmail.com"

  def rsvp_confirmation(user_id, event_id)
    @user = User.find(user_id)
    @event = Event.find(event_id)
    host = @event.user
    mail(:to => @user.email, :cc => host.email, :subject => "RSVP")
  end
end
