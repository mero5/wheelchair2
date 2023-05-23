class Public::CategoriesController < ApplicationController
  before_action :authenticate_customer!
  
  #カテゴリ一覧
  def index
    @categories = Category.all
  end

  #カテゴリ一覧
  def show
    @category = Category.find(params[:id])
    @items = @category.items
    @categories = Category.all
  end

  private

end
