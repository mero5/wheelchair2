class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  #注文ステータス更新
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_details = @order.order_details

       #１つでも制作が始まったら製作中に更新
      if @order_details.where(making_status: "製作中").count >= 1
         @order.status = "製作中"
         @order.save
      end

      if @order.order_details.count == @order_details.where(making_status: "製作完了").count
          @order.status = "発送済み"
          @order.save
      end
        redirect_to admin_order_path(@order_detail.order.id)
    else
      redirect_to admin_order_path(@order_detail.order.id)
    end
  end

  def index
    @order_details = OrderDetail.all.page(params[:page])
    @order_details = OrderDetail.all.page(params[:page]).order(created_at: :desc)
  end

  def history
    @customer = Customer.find(params[:id])
    @order_details = @customer.order_details.page(params[:page]).order(created_at: :desc)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
