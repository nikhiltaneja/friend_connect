class Event < ActiveRecord::Base

  belongs_to :user
  has_many :attendees

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 2, maximum:255 }
  validates :venue, presence: true, length: { minimum: 2, maximum:255 }

  def self.future_events
    order(:starts_at).where('starts_at >= ?',Time.now)
  end

  def host
    self.user_id
  end

end
