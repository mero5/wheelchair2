class Public::MessagesController < ApplicationController
  #after_create_commit :create_notifications

  def create
    @message = Message.new(message_params)
    if @message.save
      flash.now[:notice] = 'メッセージを送信しました'
      @room = Room.find(@message.room_id)
      @messages = Message.where(room_id: @message.room_id)
      #render room_path(message.room.customer_id) #render先にjsファイルを指定
      #@room.create_notification_message!(current_customer, message.id)
      #redirect_to room_path(message.room.customer_id)
    else
      #redirect_to room_path(message.room.customer_id), alert: 'メッセージを送信できませんでした'
    end

  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id).merge(customer_id: current_customer.id)
  end

  #def create_notifications
    #Notification.create(notifiable: self, cutomer: post)
  #end

end
