class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all
    @items_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.all
    @cart_item = CartItem.new
  end
end
