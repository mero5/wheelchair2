class Room < ApplicationRecord
  belongs_to :reservation
  has_many :messages, dependent: :destroy

  validates :reservation_id, uniqueness: true
end
