class Color < ApplicationRecord
  validates :name, presence: true
  #validates :image, presence: true
  has_one_attached :image
end
