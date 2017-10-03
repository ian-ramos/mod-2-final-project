class AddLengthToEventsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :duration, :string
  end
end
