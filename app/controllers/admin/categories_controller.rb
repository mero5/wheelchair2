class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :edit_category, only: [:edit, :update]

  #カテゴリ設定
  def index
    @category = Category.new
    @categories = Category.all
  end

  #カテゴリ登録
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

  #カテゴリ編集
  def edit
  end

  #カテゴリアップデート
  def update
    if @category.update(category_params)
      flash[:notice] = '変更を保存しました'
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  #カテゴリ削除
  def destroy
    @category = Category.find(params[:id])
    @category.destroy!
    flash[:notice] = "削除いたしました"
    redirect_to admin_categories_path
  end

  private

  def edit_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name, :image)
  end
end
