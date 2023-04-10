class Public::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      redirect_to room_path(message.room.customer_id)
    else
      redirect_to room_path(message.room.customer_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id).merge(customer_id: current_customer.id)
  end
end
