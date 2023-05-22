class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  #新しい商品
  def new
    @item = Item.new
  end

  #商品登録
  def create
    @item = Item.new(item_params)
    if @item.save
      #画像API
      tags = Vision.get_image_data(@item.image)
      tags.each do |tag|
        @item.tags.create(name: tag)
      end
      flash[:notice] = '商品を登録しました'
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  #商品一覧
  def index
    @items = Item.all
  end

  #商品詳細
  def show
  end

  #商品編集
  def edit
  end

  #商品アップデート
  def update
    if @item.update(item_params)
      flash[:notice] = '商品を更新しました'
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  #商品削除
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "削除いたしました"
    redirect_to admin_items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :category_id, :is_active)
  end
end
