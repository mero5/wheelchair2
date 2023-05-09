class Color < ApplicationRecord
  belongs_to :made_to_order
  validates :name, presence: true
end
