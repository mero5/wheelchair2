class Public::CategriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @items = @category.set_items
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
