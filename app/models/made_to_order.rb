class MadeToOrder < ApplicationRecord
  has_many :order_details,dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer
end
