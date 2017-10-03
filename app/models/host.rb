class Host < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :events_entertainers, through: :events
  has_many :messages
  has_many :entertainers, through: :messages
  validates :username, presence: true, uniqueness: true, length: {in: 5..30}

  # returns all entertainer instances employed by host, past or present

  def entertainers
    self.events.map {|event| event.entertainers }.flatten
  end

end
