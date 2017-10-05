class AddJobNeedsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :job_needs, :string
  end
end
