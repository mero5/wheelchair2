class Public::OrderDetailsController < ApplicationController
  def index
    @customer = current_customer
    @order_details = @customer.order_details.page(params[:page])
    @order_details = @customer.order_details.page(params[:page]).order(created_at: :desc)
  end
end