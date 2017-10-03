class AddClosedStatusToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :closed_status, :boolean, default: false
  end
end
