class Order < ApplicationRecord
  enum payment: ["現金", "銀行振込"]

  enum status: {受注確認中:0, 入金確認:1, 製作中:2, 発送済み:3}

  has_many :order_details,dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer

  def subtotal
    item.with_tax_price * amount
  end
end
