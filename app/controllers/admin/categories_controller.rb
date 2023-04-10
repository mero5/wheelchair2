class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :edit_category, only: [:edit, :update, :destroy]

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'カテゴリを登録しました'
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = '変更を保存しました'
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "削除いたしました"
    redirect_to admin_categories_path
  end

  private

  def edit_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end
