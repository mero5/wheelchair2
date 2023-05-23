class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  #欲しいものリストへ保存
  def create
    @item = Item.find(params[:item_id])
    @favorite = current_customer.favorites.new(item_id: @item.id)
    @favorite.save
  end

  #欲しいものリストから削除
  def destroy
    item = Item.find(params[:item_id])
    @favorite = Favorite.find_by(item_id: item.id, customer_id: current_customer.id)
    #byebug
    @favorite.destroy
  end

  #欲しいものリスト一覧
  def index
    @favorites = Favorite.all
  end

end
