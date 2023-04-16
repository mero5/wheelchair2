class Repair < ApplicationRecord
  has_many :order_details,dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer

  validates :name, presence: true
  validates :address, presence: true
  validates :wheelchair_kinds, presence: true

  enum status: {修理依頼中:0, スケジュール調整中:1, 修理完了済み:2}
end
