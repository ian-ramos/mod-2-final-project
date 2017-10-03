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

  def tax
    (self.total_entertainer_cost * 0.07).round(2)
  end

  def cut_of_profit
    (self.total_entertainer_cost * 0.1).round(2)
  end

  def subtotal #without tax, plus our cut
    self.total_entertainer_cost + self.cut_of_profit
  end

  def total #with tax
    self.subtotal + self.tax
  end

  def convert_to_two_decimals(number) #returns a string
    sprintf('%.2f', number)
  end

end
