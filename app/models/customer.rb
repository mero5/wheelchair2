class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :repairs, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def full_name
    self.first_name + " " + self.last_name
  end

  def kana_full_name
    self.kana_first_name + " " + self.kana_last_name
  end

  # 退会機能　is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def age
    today = Time.zone.today
    this_years_birthday = Time.zone.local(today.year, birth_date.month, birth_date.day)
    age = today.year - birth_date.year
    if today < this_years_birthday
      age -= 1
    end
    "#{age} 歳"
  end

end
