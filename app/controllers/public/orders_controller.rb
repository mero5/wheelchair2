class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  #注文情報入力画面
  def new
    @order = Order.new
    @customer = current_customer
    @deliveries = current_customer.delivery.all
  end

  #注文情報確認画面
  def confirm
    @total = 0
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items

      # ご自身の住所 [:address_option]=="0"としてデータをhtmlから受ける
    if params[:order][:address_option] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name

      # 登録住所 [:address_option]=="1"としてデータをhtmlから受ける
    elsif params[:order][:address_option] == "1"
      ship = Delivery.find(params[:order][:customer_id])
      #orderのcustomer_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @order.post_code = ship.post_code
      @order.address = ship.address
      @order.name = ship.name

      # 新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
    elsif params[:order][:address_option] = "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      #render 'new'
    end
    #orderテーブルの顧客idとログインしている顧客idを紐付ける
    @order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    #カート情報
    @cart_item = current_customer.cart_items.all
    @cart_item.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_details = OrderDetail.new #初期化宣言
      @order_details.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_details.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_details.price = @order.billing_amount #請求金額に代入billing_amount
      @order_details.order_id = @order.id #注文商品に注文idを紐付け
      @order_details.save #注文商品を保存
    end
    #カートの中身を削除
    current_customer.cart_items.destroy_all
    redirect_to orders_success_path
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details
  end

  # 注文完了画面
  def success
  end

  def index
    @orders = current_customer.orders
    @repairs = current_customer.repairs
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :address, :name, :payment, :billing_amount, :postage, :status)
  end
end
