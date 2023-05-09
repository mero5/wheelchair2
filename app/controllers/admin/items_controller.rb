class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      #tags = Vision.get_image_data(@item.image)
      #tags.each do |tag|
        #@item.tags.create(name: tag)
      #end
      flash[:notice] = '商品を登録しました'
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = '商品を更新しました'
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

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
