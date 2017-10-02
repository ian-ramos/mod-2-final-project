class Entertainer < ApplicationRecord

  has_many :events_entertainers
  has_many :events, through: :events_entertainers

  @@job_types = ["Musician", "Clown", "Magician", "Belly Dancer", "Animal Tamer"]

  def self.job_types
    @@job_types
  end

end
