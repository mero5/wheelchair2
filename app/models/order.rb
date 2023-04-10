class Order < ApplicationRecord
  enum payment: ["クレジットカード", "銀行振込"]

  enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  has_many :order_details,dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer

  def subtotal
    item.with_tax_price * amount
  end
end
