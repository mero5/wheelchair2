class Admin::MadeToOrdersController < ApplicationController
    before_action :authenticate_admin!
  #impressionist :actions=> [:show]

  def earnings
    @orders = Order.all
    @repairs = Repair.all
    @month = Time.current
    #修理依頼
    @this_month = Repair.where(created_at: @month.all_month)
    @last_month = Repair.where(created_at: @month.prev_month.all_month)
    @three_month = Repair.where(created_at: @month.months_ago(2).all_month)
    @four_month = Repair.where(created_at: @month.months_ago(3).all_month)
    @five_month = Repair.where(created_at: @month.months_ago(4).all_month)
    @six_month = Repair.where(created_at: @month.months_ago(5).all_month)
    #商品売上
    @this_month = Order.where(created_at: @month.all_month)
    @last_month = Order.where(created_at: @month.prev_month.all_month)
    @three_month = Order.where(created_at: @month.months_ago(2).all_month)
    @four_month = Order.where(created_at: @month.months_ago(3).all_month)
    @five_month = Order.where(created_at: @month.months_ago(4).all_month)
    @six_month = Order.where(created_at: @month.months_ago(5).all_month)
    #閲覧数
    #@this_month = Category.where(@month.all_month)
    #@category = Category.all
    #impressionist(@category, nil, unique: [:session_hash])
  end

  def index
    @orders = Order.all
    @repairs = Repair.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def history
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.status == "入金確認"
       @order_details.each do |order_detail|
        order_detail.making_status = "製作待ち"
        order_detail.save
      end
    end
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
end
