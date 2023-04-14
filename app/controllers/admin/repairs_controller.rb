class Admin::RepairsController < ApplicationController
  before_action :authenticate_admin!


  def index
    @repairs = Repair.all
  end

  def show
    @repair = Repair.find(params[:id])
  end

  def update
    @repair = Repair.find(params[:id])
    @repair.update(repair_params)
    redirect_to admin_repair_path
  end

  private

  def repair_params
    params.require(:repair).permit(:status)
  end

end
