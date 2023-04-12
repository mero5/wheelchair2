class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end
end
