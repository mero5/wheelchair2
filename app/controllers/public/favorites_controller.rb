class Public::FavoritesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @favorite = current_customer.favorites.new(item_id: @item.id)
    @favorite.save
  end

  def destroy
    item = Item.find(params[:item_id])
    @favorite = Favorite.find_by(item_id: item.id, customer_id: current_customer.id)
    #byebug
    @favorite.destroy
  end

  def index
    @favorites = Favorite.all
  end

end
