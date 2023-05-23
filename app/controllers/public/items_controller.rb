class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!

  #商品詳細
  def show
    @item = Item.find(params[:id])
    @categories = Category.all
    @cart_item = CartItem.new
  end
end
