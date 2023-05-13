class MadeToOrder < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer
  belongs_to :flame_color, class_name: 'Color', foreign_key: :flame_color_id
  belongs_to :side_color, class_name: 'Color', foreign_key: :side_color_id
  belongs_to :seat_color, class_name: 'Cloth', foreign_key: :seat_color_id
  belongs_to :back_color, class_name: 'Cloth', foreign_key: :back_color_id
end