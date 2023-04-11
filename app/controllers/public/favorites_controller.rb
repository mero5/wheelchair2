class Public::FavoritesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @favorite = current_customer.favorites.new(item_id: item.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    item = Item.find(params[:item_id])
    @favorite = current_customer.favorites.new(item_id: item.id)
    @favorite.destroy
    render 'replace_btn'
  end

  def index
    @favorites = customer.favorite.item.
  end
end
