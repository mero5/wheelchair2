class Public::RepairsController < ApplicationController
  before_action :authenticate_customer!

  #注文情報入力画面
  def new
    if Repair.new.invalid?
      @repair = Repair.new
    else
      redirect_to :new
    end
    @customer = current_customer
    @deliveries = current_customer.deliveries
    @categories = Category.all
  end

  #注文情報確認画面
  def confirm
    @repair = Repair.new(repair_params)

    #車椅子の種類
    if params[:repair][:wheelchair_kinds_option] == "0"
      shop = Category.find(params[:repair][:category_name])
      @repair.wheelchair_kinds = shop.category_name
    elsif params[:repair][:wheelchair_kinds_option] == "1"
      @repair.wheelchair_kinds = params[:repair][:wheelchair_kinds]
    end

      # ご自身の住所 [:address_option]=="0"としてデータをhtmlから受ける
    if params[:repair][:address_option] == "0"
      @repair.address = current_customer.address
      @repair.name = current_customer.full_name

      # 登録住所 [:address_option]=="1"としてデータをhtmlから受ける
    elsif params[:repair][:address_option] == "1"
      ship = Delivery.find(params[:repair][:customer_id])
      #orderのcustomer_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @repair.address = ship.delivery_address
      @repair.name = ship.delivery_name

      # 新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
    elsif params[:repair][:address_option] = "2"
      @repair.address = params[:repair][:address]
      @repair.name = params[:repair][:name]
    else
      render 'new'
    end
    #orderテーブルの顧客idとログインしている顧客idを紐付ける
    @repair.customer_id = current_customer.id
    if @repair.invalid?
      render :new
    end
  end

  def create
    @repair = Repair.new(repair_params)
    @repair.customer_id = current_customer.id
    @repair.save
    @order_details = OrderDetail.new #初期化宣言
    @order_details.customer_id = current_customer.id
    @order_details.repair_id = @repair.id #注文商品に注文idを紐付け
    @order_details.save #注文商品を保存
    redirect_to repairs_thanx_path
  end

  # 注文詳細
  def show
    @repair = current_customer.repairs.find_by(id: params[:id])
    render 'new' if @repair.blank?
  end

  # 注文完了画面
  def thanx
  end

  # ログインしてください
  #def index
  #end

  private

  def repair_params
    params.require(:repair).permit(:address, :name, :wheelchair_kinds, :tire, :break, :caster, :others)
  end
end
