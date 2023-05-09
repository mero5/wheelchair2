class Public::MadeToOrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    if MadeToOrder.new.invalid?
      @made_to_order = MadeToOrder.new
    else
      redirect_to :new
    end
    @customer = current_customer
    @made_to_order.customer_id = current_customer.id
  end

  def index
    @made_to_orders = MadeToOrder.all
  end

  def show
    @made_to_orders = MadeToOrder.all
    @made_to_order = MadeToOrder.find(params[:id])
  end

  #確認画面
  def confirm
    @made_to_order = MadeToOrder.new(made_to_order_params)
    @made_to_order.customer_id = current_customer.id
    if @made_to_order.invalid?
      render :new
    end
  end

  def back
    @made_to_order = MadeToOrder.new(made_to_order_params)
    render :new
  end

  def create
    @made_to_order = MadeToOrder.new(made_to_order_params)
    if @made_to_order.save
      redirect_to made_to_orders_thanx_path
    else
      render 'new'
    end
  end

  # 完了画面
  def thanx
  end

  private

  def made_to_order_params
    params.require(:made_to_order).permit(:message, :status, :flame, :flame2, :type,
    :material, :flame_color,:side_color, :seat_color, :back_color, :break, :nursing_break,
    :turnover, :cane, :cane2, :cushion, :table, :others)
  end

end
