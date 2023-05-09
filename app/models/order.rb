class Order < ApplicationRecord
  enum payment: ["現金", "銀行振込"]
  enum status: {受注確認中:0, 入金確認:1, 製作中:2, 発送済み:3}

  has_many :order_details,dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer
  has_many :notifications, dependent: :destroy

  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment, presence: true
  #validates :billing_amount, presence: true

  def subtotal
    item.with_tax_price * amount
  end

  def create_notification_comment!(current_customer, order_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Order.select(:customer_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
