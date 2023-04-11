class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates_uniqueness_of :item_id, scope: :customer_id
end
