class CreateEntertainers < ActiveRecord::Migration[5.1]
  def change
    create_table :entertainers do |t|
      t.string :username
      t.string :job_type
      t.string :image
      t.string :password_digest
      t.timestamps
    end
  end
end
