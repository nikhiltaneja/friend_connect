class Mailing
  @queue = :mailing

  def self.perform(user_id, event_id)
    UserMailer.rsvp_confirmation(user_id, event_id).deliver
  end
end
