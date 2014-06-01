class ChatroomController < ApplicationController

  before_action :authenticate_user!

  def show
    @room = Chatroom.find(params[:id]) 
  end

  def create
    @room = Chatroom.create_with_creator(current_user)
    redirect_to chatroom_url(@room)
  end

  def send_message
    @room = Chatroom.find(params[:id])
    message = Message.create(message_params)
    @room.messages << message
    current_user.messages << message
    redirect_to :back
  end

private

  def message_params
    params.require(:message).permit(:text)
  end

end
