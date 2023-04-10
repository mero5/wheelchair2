class HomesController < ApplicationController
  def top
    #@genres = Genre.all

    # 商品の最新4件を取得して表示
    #@items = Item.limit(4).order(created_at: :DESC)
  end

  def about
  end
end
