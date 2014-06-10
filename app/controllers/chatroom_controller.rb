class ChatroomController < ApplicationController
  include ActionController::Live

  before_action :authenticate_user!

  def show
    @room = Chatroom.find(params[:id]) 
    @messages = @room.messages
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

  def events
    room = Chatroom.find(params[:id]) 
    response.headers["Content-Type"] = "text/event-stream"
    # start = Time.zone.now
    messages = room.messages.filter( |m| m.created_at > start)
    room.messages.each do |message|
      response.stream.write "data: #{message.text}\n\n"
    end 
  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
  end


private

  def message_params
    params.require(:message).permit(:text)
  end

end
