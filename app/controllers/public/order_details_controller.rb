class Public::OrderDetailsController < ApplicationController


  #注文依頼履歴一覧
  def index
    @customer = current_customer
    @order_details = @customer.order_details.page(params[:page])
    @order_details = @customer.order_details.page(params[:page]).order(created_at: :desc)
  end
end