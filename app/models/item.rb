class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :image
    validates :category_id
  end

  belongs_to :category

  has_one_attached :image

  has_many :order_details
  has_many :order, through: :order_details
  has_many :cart_items, dependent: :destroy

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end

  def self.search_for(word)
    Item.where('name LIKE ?', '%' + word + '%' )
  end
end
