class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!
  #after_create_commit :create_notifications

  def index
    @rooms = Room.all.page(params[:page]).order(created_at: :desc)
    @contacts = Contact.all.page(params[:page]).order(created_at: :desc)
    #@message = Room.all.message(created_at: :desc)
    @read_count = Read.where(open_time: nil).count
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end

  private

  #def create_notifications
    #Notification.create(notifiable: self, cutomer: post)
  #end
end
