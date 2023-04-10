class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def full_name
    self.first_name + " " + self.last_name
  end

  def kana_full_name
    self.kana_first_name + " " + self.kana_last_name
  end

end
