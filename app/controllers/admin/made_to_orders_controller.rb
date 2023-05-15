class Admin::MadeToOrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @made_to_orders = MadeToOrder.all
  end

  def show
    @made_to_order_new = MadeToOrder.new
    @made_to_order = MadeToOrder.find(params[:id])
  end

  def history
    @customer = Customer.find(params[:id])
    @made_to_orders = @customer.made_to_orders
  end

  def update
    @made_to_order = MadeToOrder.find(params[:id])
    @made_to_order.update(made_to_order_params)
    #redirect_to request.referer
  end

  def create
    @made_to_order_new = MadeToOrder.new(made_to_order_params)
    @made_to_order = MadeToOrder.find(params[:id])
    if @made_to_order.save
      flash[:notice] = "保存いたしました"
      redirect_to request.referer
    else
      @made_to_order_new = MadeToOrder.new(made_to_order_params)
      @made_to_order = MadeToOrder.find(params[:id])
      render :show
    end
  end

  private

  def made_to_order_params
    params.require(:made_to_order).permit(:status, :message)
  end
end
