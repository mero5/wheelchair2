class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  #会員一覧
  def index
    @customers = Customer.page(params[:page])
  end

  #会員詳細
  def show
    @customer_new = Customer.new
    @customer = Customer.find(params[:id])
  end

  #会員編集
  def edit
    @customer = Customer.find(params[:id])
  end

  #会員保存
  def create
    @customer_new = Customer.new(customer_params)
    @customer = Customer.find(params[:id])
    if @customer.save
      flash[:notice] = "保存いたしました"
      redirect_to request.referer
    else
      @repair_new = Repair.new(customer_params)
      @customer = Customer.find(params[:id])
      render :show
    end
  end

  #会員詳細ページのメモアップデート
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end

  #会員ステータスの更新
  def customer_update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = '保存しました'
      redirect_to admin_customer_path
    else
     render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,
    :birth_date,:email,:encrypted_password,:post_code,:address,:telephone_number,:is_deleted, :message)
  end
end
