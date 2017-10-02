class Host < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :events_entertainers, through: :events
  validates :username, presence: true, uniqueness: true, length: {in: 5..30}

  # returns all entertainer instances employed by host, past or present

  attr_reader :entertainer_usernames

  def entertainers
    self.events.map {|event| event.entertainers }.flatten
  end

  # def entertainer_usernames=(usernames)
  #   usernames.each do |username|
  #     entertainer = Entertainer.find_by(username: username)
  #     self.entertainers << entertainer
  #     byebug
  #   end
  # end

end
