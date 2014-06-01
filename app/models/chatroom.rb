class Chatroom < ActiveRecord::Base
  belongs_to :creator
  belongs_to :messages
end
