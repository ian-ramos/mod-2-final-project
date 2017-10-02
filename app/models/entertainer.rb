class Entertainer < ApplicationRecord

  has_many :events
  has_many :hosts, through: :events

  @@job_types = ["Musician", "Clown", "Magician", "Belly Dancer", "Animal Tamer"]

  def self.job_types
    @@job_types
  end

end
