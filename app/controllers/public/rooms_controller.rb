class Public::RoomsController < ApplicationController
  #before_action :authenticate_customer!
  #after_create_commit :create_notifications

  def create
    if customer_signed_in?
      @room = current_customer.room
      if @room.nil?
        @room = Room.create(customer_id: current_customer.id)
      end
      redirect_to room_path(@room)
    else
      redirect_to rooms_path
    end
  end

  def show
    @room = Room.find_by(customer_id: current_customer.id)
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end

  private

  #def create_notifications
    #Notification.create(notifiable: self, cutomer: post)
  #end

end
