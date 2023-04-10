class Admin::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      redirect_to request.referer
    else
      redirect_to request.referer alert: 'メッセージを送信できませんでした'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id).merge(admin_id: current_admin.id)
  end
end
