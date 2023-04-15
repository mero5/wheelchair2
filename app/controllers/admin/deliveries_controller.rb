class Admin::DeliveriesController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @deliveries = @customer.delivery.all
  end
end
