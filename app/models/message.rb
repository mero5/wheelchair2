class Message < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin, optional: true
  belongs_to :room
  #has_one :notification, as: :notifiable, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :message, presence: true

  def save_tags(savebook_tags)
    # 現在のユーザーの持っているskillを引っ張ってきている
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 今bookが持っているタグと今回保存されたものの差をすでにあるタグとする。古いタグは消す。
    old_tags = current_tags - savebook_tags
    # 今回保存されたものと現在の差を新しいタグとする。新しいタグは保存
    new_tags = savebook_tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      book_tag = Tag.find_or_create_by(name:new_name)
      # 配列に保存
      self.tags << book_tag
    end
  end
  
  def create_notification_message!(current_customer, message_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Order.select(:customer_id).where(post_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_message!(current_user, message_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_message!(current_user, message_id, user_id) if temp_ids.blank?
  end

  def save_notification_message!(current_user, message_id, visited_id)
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
