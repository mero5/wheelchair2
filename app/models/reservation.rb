class Reservation < ApplicationRecord
  has_one :room, dependent: :destroy
end
