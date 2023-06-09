class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :repairs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :made_to_orders, dependent: :destroy
  has_many :reads, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  # フルネーム
  def full_name
    self.first_name + " " + self.last_name
  end

  # カタカナのフルネーム
  def kana_full_name
    self.kana_first_name + " " + self.kana_last_name
  end

  # 退会機能　is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # 生年月日から年齢を出す
  def age
    today = Time.zone.today
    this_years_birthday = Time.zone.local(today.year, birth_date.month, birth_date.day)
    age = today.year - birth_date.year
    if today < this_years_birthday
      age -= 1
    end
    "#{age} 歳"
  end

  def self.member_search_for(word)
    Customer.where('first_name LIKE ? or last_name LIKE ? or kana_first_name LIKE ? or kana_last_name LIKE ?
                      or email LIKE ? or post_code LIKE ? or address LIKE ? or telephone_number LIKE ?',
    '%'+word+'%','%'+word+'%','%'+word+'%','%'+word+'%','%'+word+'%','%'+word+'%','%'+word+'%','%'+word+'%')
  end

end
