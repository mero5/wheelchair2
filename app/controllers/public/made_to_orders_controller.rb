class Public::MadeToOrdersController < ApplicationController
  def new
    @made_to_order = MadeToOrder.new
  end

  def index
    @made_to_orders = Made_to_order.all
  end

  def show
    @made_to_orders = Made_to_order.all
    @made_to_order = Made_to_order.find(params[:id])
  end

  #確認画面
  def confirm
    @made_to_order = Made_to_order.new(contact_params)
    if @made_to_order.invalid?
      render :new
    end
  end

  def create
    @made_to_order = Made_to_order.new(contact_params)
    if @made_to_order.save
      redirect_to made_to_order_thanx_path
    else
      render 'new'
    end
  end

  # 完了画面
  def thanx
  end

  private

  def contact_params
    params.require(:made_to_order).permit(:name, :email, :phone_number, :subject, :message, :status)
  end

end
