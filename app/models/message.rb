class Message < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin, optional: true
  belongs_to :room

  validates :message, presence: true
end
