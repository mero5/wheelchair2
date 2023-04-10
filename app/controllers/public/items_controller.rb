class Public::ItemsController < ApplicationController
  def index
    @items = category.Item.all
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.all
    @cart_item = CartItem.new
  end
end
