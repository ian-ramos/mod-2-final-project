class Host < ApplicationRecord
  has_many :events
  has_many :events_entertainers, through: :events
  validates :username, presence: true, uniqueness: true, length: {in: 5..30}
end
