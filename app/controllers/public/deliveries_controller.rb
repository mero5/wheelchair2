class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  #配送先一覧
  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries
  end

  #配送先編集
  def edit
    @delivery = Delivery.find(params[:id])
  end

  #配送先保存
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      flash[:notice] = "保存いたしました"
      redirect_to deliveries_path
    else
      @deliveries = Delivery.all
      render :index
    end
  end

  #配送先更新
  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      flash[:notice] = "アップデートいたしました"
      redirect_to deliveries_path
    else
      render :edit
    end
  end

  #配送先削除
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    flash[:notice] = "削除いたしました"
    redirect_to deliveries_path
  end

  def delivery_params
    params.require(:delivery).permit(:delivery_postcode, :delivery_address, :delivery_name)
  end
end
