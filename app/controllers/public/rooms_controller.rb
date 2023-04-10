class Public::RoomsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @room = current_customer.room
    if @room.nil?
      @room = Room.create(customer_id: current_customer.id)
    end
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find_by(customer_id: current_customer.id)
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end

end
