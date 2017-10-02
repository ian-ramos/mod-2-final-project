class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :host_id
      t.integer :entertainer_id
      t.datetime :date

      t.timestamps
    end
  end
end
