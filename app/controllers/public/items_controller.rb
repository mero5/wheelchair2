class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @categories = Category.all
    @cart_item = CartItem.new
  end
end
