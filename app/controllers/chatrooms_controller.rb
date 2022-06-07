class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  # def create
  #   @chatroom = Chatroom.new(chatroom_params)
  #   @chatroom.event = @event
  #   @chatroom.user = current_user

  #   if @chatroom.save
  #     redirect_to chatroom_path(@chatroom)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

private

  def chatroom_params
    params.require(:event).permit(:name, :event_id)
  end
end
