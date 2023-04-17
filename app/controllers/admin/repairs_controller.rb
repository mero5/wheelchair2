class Admin::RepairsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @repairs = Repair.all
  end

  def show
    @repair_new = Repair.new
    @repair = Repair.find(params[:id])
  end

  def update
    @repair = Repair.find(params[:id])
    @repair.update(repair_params)
    redirect_to request.referer
  end

  def create
    @repair_new = Repair.new(repair_params)
    @repair = Repair.find(params[:id])
    if @repair.save
      flash[:notice] = "保存いたしました"
      redirect_to request.referer
    else
      @repair_new = Repair.new(repair_params)
      @repair = Repair.find(params[:id])
      render :show
    end
  end

  private

  def repair_params
    params.require(:repair).permit(:status, :message)
  end

end
