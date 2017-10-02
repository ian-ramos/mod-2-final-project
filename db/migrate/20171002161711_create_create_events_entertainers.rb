class CreateCreateEventsEntertainers < ActiveRecord::Migration[5.1]
  def change
    create_table :create_events_entertainers do |t|
      t.integer :entertainer_id
      t.integer :event_id
      t.timestamps
    end
  end
end
