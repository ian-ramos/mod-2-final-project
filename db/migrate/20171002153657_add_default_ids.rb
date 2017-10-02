class AddDefaultIds < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :host_id, :integer, default: nil
  end
end
