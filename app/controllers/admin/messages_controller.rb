class Admin::MessagesController < ApplicationController
  after_create_commit :create_notifications

  def create
    message = Message.new(message_params)
    if message.save
      @room.create_notification_message!(current_customer, message.id)
      redirect_to request.referer
    else
      redirect_to request.referer alert: 'メッセージを送信できませんでした'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id).merge(admin_id: current_admin.id)
  end

  def create_notifications
    Notification.create(notifiable: self, cutomer: post)
  end

end
