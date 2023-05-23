class HomesController < ApplicationController
  # トップページ
  def top
    @categories = Category.all
  end

  # 企業案内
  def about
  end
end
