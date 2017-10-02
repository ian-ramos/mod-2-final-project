class Host < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: {in: 5..30}
end
