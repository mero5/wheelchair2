class Admin::DeliveriesController < ApplicationController
  before_action :authenticate_admin!

  #配送先一覧
  def show
    @customer = Customer.find(params[:id])
    @deliveries = @customer.deliveries
  end
end
