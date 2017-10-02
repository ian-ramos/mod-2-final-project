class Entertainer < ApplicationRecord

  @@job_types = ["Musician", "Clown", "Magician", "Belly Dancer", "Animal Tamer"]

  def self.job_types
    @@job_types
  end

end
