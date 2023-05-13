class Public::OrderDetailsController < ApplicationController
  def index
    @order_details = current_customer.order_details.page(params[:page])
    @order_details = current_customer.order_details.page(params[:page]).order(created_at: :desc)
  end
end