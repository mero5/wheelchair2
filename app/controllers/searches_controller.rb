class SearchesController < ApplicationController
  before_action :word_all                            # Genreの全情報を全ページへ渡す

  def search
    @word = params[:word]
    if @word.length == 0 || @word.length >= 20        # 入力された文字が0~20文字であれば検索する、それ以外は元のページへ遷移する
      redirect_back fallback_location: root_path
    else
      @result = Item.search_for(@word)
    end
  end

  def category_search
    @word = params[:category_word]                    # 入力された文字を取得する
    @items = params[:items]                           # ジャンルに紐づいた商品のIDを配列で取得する
    @result = Item.where(id: @items)                  # 該当のidを探してインスタンス変数へ渡す
  end

  def member_search
    @word = params[:word]
    if @word.length == 0 || @word.length >= 20        # 入力された文字が0~20文字であれば検索する、それ以外は元のページへ遷移する
      redirect_back fallback_location: root_path
    else
      @result = Item.search_for(@word)
      @members = Customer.member_search_for(@word)
    end
  end

  def word_all
    @categories = Category.all
    @customer = Customer.all
  end
end
