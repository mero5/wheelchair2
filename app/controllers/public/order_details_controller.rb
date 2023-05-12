class Public::OrderDetailsController < ApplicationController
  def index
    @order_details = current_customer.order_details
    @order_details = current_customer.order_details.order(created_at: :desc)
  end
end