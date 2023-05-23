class Public::MadeToOrdersController < ApplicationController
  before_action :authenticate_customer!

  #オーダーメイド見積依頼
  def new
    @cloths = Cloth.all
    @colors = Color.all
    if MadeToOrder.new.invalid?
      @made_to_order = MadeToOrder.new
    else
      redirect_to :new
    end
    @customer = current_customer
    @made_to_order.customer_id = current_customer.id
  end

  #オーダーメイド見積依頼はログインしてからでないと使用できません
  #def index
  #end

  #オーダーメイド見積依頼詳細
  def show
    @made_to_order = current_customer.made_to_orders.find_by(id: params[:id])
    render 'new' if @made_to_order.blank?
  end

  #確認画面
  def confirm
    @made_to_order = MadeToOrder.new(made_to_order_params)
    @made_to_order.customer_id = current_customer.id

    #フレーム
    if params[:made_to_order][:flame2_option] == "0"
      @made_to_order.flame2 = "普通型"
    elsif params[:made_to_order][:flame2_option] == "1"
      @made_to_order.flame2 = "リクライニング"
    elsif params[:made_to_order][:flame2_option] == "2"
      @made_to_order.flame2 = params[:made_to_order][:flame2]
    end

    #フレーム色
    @made_to_order.flame_color = Color.find(params[:made_to_order][:name])
    #サイドガード色
    @made_to_order.side_color = Color.find(params[:made_to_order][:color_id])
    #座シート色
    @made_to_order.seat_color = Cloth.find(params[:made_to_order][:cloth_seat_id])
    #背シート色
    @made_to_order.back_color = Cloth.find(params[:made_to_order][:cloth_id])

    if @made_to_order.invalid?
      render :new
    end
  end

  #オーダーメイド見積依頼newページへ遷移
  def back
    @made_to_order = MadeToOrder.new(made_to_order_params)
    render :new
  end

  #オーダーメイド見積依頼完了
  def create
    @made_to_order = MadeToOrder.new(made_to_order_params)
    @made_to_order.customer_id = current_customer.id
    if @made_to_order.save
      @order_details = OrderDetail.new #初期化宣言
      @order_details.made_to_order_id = @made_to_order.id #注文商品に注文idを紐付け
      @order_details.customer_id = current_customer.id
      @order_details.save #注文商品を保存
      redirect_to made_to_orders_thanx_path
    else
      render 'new'
    end
  end

  # 完了画面
  def thanx
  end

  private

  def made_to_order_params
    params.require(:made_to_order).permit(:customer_id, :message, :status, :flame, :flame2, :wheelchair_type,
    :material, :flame_color_id,:side_color_id, :seat_color_id, :back_color_id, :break, :nursing_break,
    :turnover, :cane, :cane2, :cushion, :table, :others)
  end

end
