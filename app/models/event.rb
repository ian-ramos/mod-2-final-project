class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}, length: {minimum: 10}, uniqueness: {scope: :host_id, message: "You already have an event that day!"}
  validates :date, presence: true




  belongs_to :host, optional: true
  belongs_to :entertainer, optional: true

  # def initialize(args)
  #   @name = args[:name]
  #   @description = args[:description]
  #   @date = args[:date]
  #   @host_id = nil
  #   @entertainer_id = nil
  # end

end
