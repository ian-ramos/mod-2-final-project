class EventsEntertainer < ApplicationRecord

  belongs_to :event
  belongs_to :entertainer
  validates_uniqueness_of :event_id, scope: :entertainer_id

end
