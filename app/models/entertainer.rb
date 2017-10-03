class Entertainer < ApplicationRecord
  has_secure_password
  has_many :events_entertainers
  has_many :events, through: :events_entertainers
  validates :username, presence: true, uniqueness: true, length: {in: 1..30}
  validates :rate, presence: true, exclusion: {in: ["0"]}
  validates :description, presence: true

  attr_reader :event_ids

  @@job_types = ["Musician", "Clown", "Magician", "Belly Dancer", "Animal Tamer"]

  def self.job_types
    @@job_types
  end

  def hosts
    self.events.map do |event|
      Host.find(event.host_id)
    end
  end

  def event_ids=(event_ids)
    event_ids.each do |event_id|
      event = Event.find(event_id)
      self.events << event
    end
  end

end
