class Entertainer < ApplicationRecord

  has_many :events_entertainers
  has_many :events, through: :events_entertainers
  validates :username, presence: true, uniqueness: true, length: {in: 5..30}

  @@job_types = ["Musician", "Clown", "Magician", "Belly Dancer", "Animal Tamer"]

  def self.job_types
    @@job_types
  end

  def hosts
    self.events.map do |event|
      Host.find(event.host_id)
    end
  end

end
