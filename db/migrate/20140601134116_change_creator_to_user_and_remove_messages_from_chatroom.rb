class ChangeCreatorToUserAndRemoveMessagesFromChatroom < ActiveRecord::Migration
  def change
    remove_column :chatrooms, :messages_id
    remove_column :chatrooms, :creator_id
    add_column :chatrooms, :user_id, :integer
  end
end
