class Delivery < ApplicationRecord
  belongs_to :customer

  validates :delivery_postcode, presence: true
  validates :delivery_address, presence: true
  validates :delivery_name, presence: true

  def full_delivery
    self.postcode + " " + self.address + " " + self.name
  end
end
