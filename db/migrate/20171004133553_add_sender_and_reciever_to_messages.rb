class AddSenderAndRecieverToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sender, :string
    add_column :messages, :receiver, :string
  end
end
