class Notification < ApplicationRecord
  #belongs_to :notifiable, polymorphic: true
  #belongs_to :customer

  default_scope -> { order(created_at: :desc) }

  belongs_to :order, optional: true
  belongs_to :repair, optional: true

  belongs_to :visitor, class_name: 'customer', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'customer', foreign_key: 'visited_id', optional: true
end
