class Admin::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      redirect_to admins_room_path(message.room.customer_id)
    else
      redirect_to admins_room_path(message.room.reservation_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id).merge(admin_id: current_admin.id)
  end
end
