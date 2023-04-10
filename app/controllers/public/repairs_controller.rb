class Public::RepairsController < ApplicationController
  before_action :authenticate_customer!

  #注文情報入力画面
  def new
    @repair = Repair.new
    @customer = current_customer
    @deliveries = current_customer.delivery.all
    @categories = Category.all
  end

  #注文情報確認画面
  def confirm
    @repair = Repair.new(repair_params)

    #車椅子の種類

      # ご自身の住所 [:address_option]=="0"としてデータをhtmlから受ける
    if params[:repair][:address_option] == "0"
      @repair.address = current_customer.address
      @repair.name = current_customer.full_name

      # 登録住所 [:address_option]=="1"としてデータをhtmlから受ける
    elsif params[:repair][:address_option] == "1"
      ship = Delivery.find(params[:order][:customer_id])
      #orderのcustomer_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @repair.address = ship.address
      @repair.name = ship.name

      # 新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
    elsif params[:repair][:address_option] = "2"
      @repair.address = params[:order][:address]
      @repair.name = params[:order][:name]
    else
      #render 'new'
    end
    #orderテーブルの顧客idとログインしている顧客idを紐付ける
    @repair.customer_id = current_customer.id
  end

  def create
    @repair = Repair.new(repair_params)
    @repair.customer_id = current_customer.id
    @repair.save
    redirect_to repairs_thanx_path
  end

  def show
    @repair = current_customer.orders.find(params[:id])
    @order_details = @order.order_details
  end

  # 注文完了画面
  def thanx
  end

  def index
    @repairs = current_customer.repairs
  end

  private

  def repair_params
    params.require(:repair).permit(:address, :name, :wheelchair_kinds, :tire, :break, :caster)
  end
end
