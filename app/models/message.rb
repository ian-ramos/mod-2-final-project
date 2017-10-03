class Message < ApplicationRecord
  belongs_to :entertainer
  belongs_to :host

  attr_reader :entertainer_username, :host_username

  @@sender = {}
  @@receiver = {}

  def self.sender
    @@sender
  end

  def self.receiver
    @@receiver
  end

  def entertainer_username=(username)
    entertainer = Entertainer.find_by(username: username)
    self.entertainer = entertainer
  end

  def host_username=(username)
    host = Host.find_by(username: username)
    self.host = host
  end

  def sender(username)
    if @@sender[username]
      @@sender[username] << self
    else
      @@sender[username] = []
      @@sender[username] << self
    end
  end

  def receiver(username)
    if @@receiver[username]
      @@receiver[username] << self
    else
      @@receiver[username] = []
      @@receiver[username] << self
    end
  end

end
