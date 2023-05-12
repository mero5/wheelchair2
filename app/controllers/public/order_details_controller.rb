class Public::OrderDetailsController < ApplicationController
  def index
    @order_details = current_customer.order_detail.all
    @orders = current_customer.orders
    @repairs = current_customer.repairs
    @made_to_orders = current_customer.made_to_orders
  end
end
