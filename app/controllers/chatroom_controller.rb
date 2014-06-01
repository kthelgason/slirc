class ChatroomController < ApplicationController

  before_action :authenticate_user!

  def show
    @room = Chatroom.find(params[:id]) 
  end

  def create
    @room = Chatroom.create_with_creator(current_user)
    redirect_to chatroom_url(@room)
  end

end
