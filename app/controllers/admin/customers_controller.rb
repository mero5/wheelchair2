class Admin::CustomersController < ApplicationController
   before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer_new = Customer.new
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

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

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     flash[:notice] = '更新が完了しました！'
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
