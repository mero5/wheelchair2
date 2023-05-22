class Admin::MadeToOrdersController < ApplicationController
  before_action :authenticate_admin!

  #オーダーメイド見積依頼一覧
  #def index
    #@made_to_orders = MadeToOrder.all
  #end

  #オーダーメイド見積依頼詳細
  def show
    @made_to_order_new = MadeToOrder.new
    @made_to_order = MadeToOrder.find(params[:id])
  end

  #オーダーメイド詳細ページのメモアップデート
  def update
    @made_to_order = MadeToOrder.find(params[:id])
    @made_to_order.update(made_to_order_params)
  end

  #オーダーメイドステータスの更新
  def made_to_order_update
    @made_to_order = MadeToOrder.find(params[:id])
    @made_to_order.update(made_to_order_params)
    redirect_to request.referer
  end

  #オーダーメイド見積依頼保存
  def create
    @made_to_order_new = MadeToOrder.new(made_to_order_params)
    @made_to_order = MadeToOrder.find(params[:id])
    if @made_to_order.save
      flash[:notice] = "保存いたしました"
      redirect_to request.referer
    else
      @made_to_order_new = MadeToOrder.new(made_to_order_params)
      @made_to_order = MadeToOrder.find(params[:id])
      render :show
    end
  end

  private

  def made_to_order_params
    params.require(:made_to_order).permit(:status, :message)
  end
end
