class Category < ApplicationRecord
  validates :category_name, presence: true
  validates :image, presence: true
  has_many :items
  has_one_attached :image
  has_ancestry
  is_impressionable

end
