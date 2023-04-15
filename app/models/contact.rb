class Contact < ApplicationRecord
  has_many :order_details,dependent: :destroy

  enum status: {電話:0, メール:1}

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :subject, presence: true
  validates :message, presence: true
  validates :status, presence: true
end
