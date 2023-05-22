class Admin::ColorsController < ApplicationController
  before_action :authenticate_admin!
  before_action :edit_color, only: [:edit, :update]

  #カラー設定
  def index
    @color = Color.new
    @colors = Color.all
  end

  def edit
    @Color = Color.find(params[:id])
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      flash[:notice] = "保存いたしました"
      redirect_to admin_colors_path
    else
      @colors = Color.all
      render :index
    end
  end

  def update
    @color = Color.find(params[:id])
    if @color.update(color_params)
      flash[:notice] = "アップデートいたしました"
      redirect_to admin_colors_path
    else
      render :edit
    end
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    flash[:notice] = "削除いたしました"
    redirect_to admin_colors_path
  end

  def edit_color
    @color = Color.find_by(id: params[:id])
  end

  def color_params
    params.require(:color).permit(:name, :image, :is_active)
  end
end
