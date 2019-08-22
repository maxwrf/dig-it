class AddNameToConversation < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :name, :string
    remove_column :conversations, :sender_id
    remove_column :conversations, :recipient_id
  end
end
