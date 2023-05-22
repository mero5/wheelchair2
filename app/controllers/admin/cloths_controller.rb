class Admin::ClothsController < ApplicationController
  before_action :authenticate_admin!
  before_action :edit_cloth, only: [:edit, :update]

  #シート生地カラー一覧
  def index
    @cloth = Cloth.new
    @cloths = Cloth.all
  end

  #シート生地カラー編集
  def edit
    @cloth = Cloth.find(params[:id])
  end

  #シート生地カラー登録
  def create
    @cloth = Color.new(cloth_params)
    if @cloth.save
      flash[:notice] = "保存いたしました"
      redirect_to admin_cloths_path
    else
      @cloths = Cloth.all
      render :index
    end
  end

  #シート生地カラーアップデート
  def update
    @cloth = Color.find(params[:id])
    if @cloth.update(cloth_params)
      flash[:notice] = "アップデートいたしました"
      redirect_to admin_cloths_path
    else
      render :edit
    end
  end

  #シート生地カラー削除
  def destroy
    @cloth = Color.find(params[:id])
    @cloth.destroy
    flash[:notice] = "削除いたしました"
    redirect_to admin_cloths_path
  end

  def edit_cloth
    @cloth = Cloth.find_by(id: params[:id])
  end

  def cloth_params
    params.require(:cloth).permit(:name, :image, :is_active)
  end
end
