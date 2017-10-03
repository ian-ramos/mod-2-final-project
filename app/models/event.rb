class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {in: 10..500}, uniqueness: {scope: :host_id, message: "You already have an event that day!"}
  validates :date, presence: true

  belongs_to :host, optional: true
  has_many :events_entertainers
  has_many :entertainers, through: :events_entertainers

  def entertainer_cost(entertainer)
    entertainer.rate.to_f * self.duration.to_f
  end

  def total_entertainer_cost
    self.entertainers.map {|entertainer| self.entertainer_cost(entertainer)}.inject {|acc, cost| acc += cost}
  end

  def cut_of_profit
    self.total_entertainer_cost * 0.1
  end

end
