class Public::CategriesController < ApplicationController
  def index
    @categories = Category.all
    @parents = Category.where(ancestry: nil)
  end

  def show
    @items = @category.set_items
    @items = @items.where(buyer_id: nil).order("created_at DESC").page(params[:page]).per(9)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
