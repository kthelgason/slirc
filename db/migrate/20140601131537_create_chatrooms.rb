class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :uniqueURL
      t.references :creator, index: true
      t.references :messages, index: true

      t.timestamps
    end
  end
end
