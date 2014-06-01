class AddChatroomRelationToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :chatroom, index: true
  end
end
