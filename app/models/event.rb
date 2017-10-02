class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}, length: {minimum: 10}, uniqueness: {scope: :host_id, message: "You already have an event that day!"}
  validates :date, presence: true


  belongs_to :host
  belongs_to :entertainer

end
