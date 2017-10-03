class AddRateAndDescriptionToEntertainers < ActiveRecord::Migration[5.1]
  def change
    add_column :entertainers, :rate, :string
    add_column :entertainers, :description, :text
  end
end
