require 'securerandom'

class Chatroom < ActiveRecord::Base
  belongs_to :user
  has_many :messages


# Class methods

  def self.create_with_creator(creator)
    random_UUID = SecureRandom.base64
    creator.chatrooms.create(uniqueURL: random_UUID)
  end
end
