# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
  [
    {first_name: "守田",
    last_name: "祥真",
    kana_first_name: "モリタ",
    kana_last_name: "ショウマ",
    email: "ss@icloud.com",
    birth_date: "1960-01-01",
    post_code: "8764326",
    address: "大阪市西区九条13-257",
    telephone_number: "08063824887",
    password: "ss1111"},

    {first_name: "佐藤",
    last_name: "あきら",
    kana_first_name: "サトウ",
    kana_last_name: "アキラ",
    email: "sato@icloud.com",
    birth_date: "1965-01-01",
    post_code: "3542378",
    address: "東京都港区神園町3-167",
    telephone_number: "09045612345",
    password: "sato1111"},

    {first_name: "後藤",
    last_name: "幸子",
    kana_first_name: "ゴトウ",
    kana_last_name: "サチコ",
    email: "goto@icloud.com",
    birth_date: "1955-01-01",
    post_code: "8763798",
    address: "東京都港区芝浦1-432",
    telephone_number: "08076512568",
    password: "goto1111"}
  ]
)

Admin.create!(
  [
    { email: "admin@admin.com", password: "ad1111"},
  ]
)

Category.create!(
  [
    { category_name: "リクライニング",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/リクライニング111.png"), filename:"リクライニング111.png")},

    { category_name: "電動車椅子" ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/電動111.png"), filename:"電動111.png")},

    { category_name: "アクティブ車椅子" ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/アクティブ111.png"), filename:"アクティブ111.png")},

    { category_name: "スポーツ車椅子" ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スポーツ111.png"), filename:"スポーツ111.png")},

    { category_name: "スタンダート車椅子" ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スタンダート111.png"), filename:"スタンダート111.png")},

    { category_name: "その他介護用品" ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/介護111.png"), filename:"介護111.png")}
  ]
)

Item.create!(
  [
    { category_id: 1,
    name: "リクライニング車椅子",
    introduction: "プッシュアップ動作や膝部の安定に。スラリとしたフロントを演出。",
    price: 320000 ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/リクライニング.png"), filename:"リクライニング.png"),
    is_active: false
    },

    { category_id: 2,
    name: "電動車椅子",
    introduction: "高性能な軽量型電動車椅子。",
    price: 300000 ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/電動車いす.png"), filename:"電動車いす.png"),
    is_active: false
    },

    { category_id: 3,
    name: "AS-Ⅲ",
    introduction: "強度と美しさをあわせもつ、身体と一体となるフレームワーク。",
    price: 160000 ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/車椅子.png"), filename:"車椅子.png"),
    is_active: false
    },

    { category_id: 3,
    name: "MS-Ⅲ",
    introduction: "プッシュアップ動作や膝部の安定に。スラリとしたフロントを演出。",
    price: 160000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/車椅子2.png"), filename:"車椅子2.png"),
    is_active: false
    },

    { category_id: 4,
    name: "バスケットボール用車椅子",
    introduction: "抜群の一体感バスケットボール用の車椅子。",
    price: 313000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スポーツ.png"), filename:"スポーツ.png"),
    is_active: false
    },

    { category_id: 4,
    name: "バスケットボール用車椅子",
    introduction: "ツインバスケットボール用の車椅子。",
    price: 313000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スポーツ2.png"), filename:"スポーツ2.png"),
    is_active: false
    },

    { category_id: 4,
    name: "スポーツ用車椅子",
    introduction: "車椅子スポーツの入門や体験用の車椅子。",
    price: 253000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スポーツ車椅子.png"), filename:"スポーツ車椅子.png"),
    is_active: false
    },

    { category_id: 4,
    name: "バトミントン用車椅子",
    introduction: "素早い前後の動きで、相手からのクリアショットに対応。",
    price: 313000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スポーツ3.png"), filename:"スポーツ3.png"),
    is_active: false
    },

    { category_id: 4,
    name: "ソフトボール用車椅子",
    introduction: "走攻守の動作に対応しダイナミックなプレーを可能にします。",
    price: 313000 ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スポーツ4.png"), filename:"スポーツ4.png"),
    is_active: false
    },

    { category_id: 5,
    name: "スタンダート車椅子446",
    introduction: "スタンダートタイプの介助用車椅子。",
    price: 127000 ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スタンダート.png"), filename:"スタンダート.png"),
    is_active: false
    },

    { category_id: 5,
    name: "スタンダート車椅子426",
    introduction: "スタンダートタイプの介助用車椅子。",
    price: 165000 ,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/スタンダート (2).png"), filename:"スタンダート (2).png"),
    is_active: false
    },

    { category_id: 6,
    name: "アルミ製松葉杖",
    introduction: "高さ調整可能",
    price: 6400,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/杖.png"), filename:"杖.png"),
    is_active: false
    },

    { category_id: 6,
    name: "木製松葉杖",
    introduction: "高さ調整可能",
    price: 4600,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/杖 (2).png"), filename:"杖 (2).png"),
    is_active: false
    },

    { category_id: 6,
    name: "T字杖",
    introduction: "高さ調整可能",
    price: 4500,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/杖 (3).png"), filename:"杖 (3).png"),
    is_active: false
    },

    { category_id: 6,
    name: "アルミ製四脚杖",
    introduction: "高さ調整可能",
    price: 12700,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/杖 (4).png"), filename:"杖 (4).png"),
    is_active: false
    },

    { category_id: 6,
    name: "トレウォーク",
    introduction: "室内用歩行車。高さ調整がワンタッチで手間いらず。",
    price: 32000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/介護 (2).png"), filename:"介護 (2).png"),
    is_active: false
    },

    { category_id: 6,
    name: "シニアカー",
    introduction: "高さ調整可能",
    price: 54000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/シニアカー.png"), filename:"シニアカー.png"),
    is_active: false
    },

    { category_id: 6,
    name: "クッション",
    introduction: "やわらかくて長持ちします",
    price: 34000,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/クッション.png"), filename:"クッション.png"),
    is_active: false
    }
  ]
)

Order.create!(
  [
  {customer_id: 1,
  post_code: "8764326",
  address: "大阪市西区九条13-257",
  name: "守田 祥真",
  postage: 0,
  billing_amount: 674300,
  payment: "現金",
  status: "受注確認中"},

  {customer_id: 1,
  post_code: "8764326",
  address: "大阪市西区九条13-257",
  name: "守田 祥真",
  postage: 0,
  billing_amount: 688600,
  payment: "現金",
  status: "受注確認中",
  message: nil},

  {customer_id: 2,
  post_code: "3542378",
  address: "東京都港区神園町3-167",
  name: "佐藤 あきら",
  postage: 0,
  billing_amount: 40260,
  payment: "現金",
  status: "受注確認中",
  message: nil}
  ]
)

OrderDetail.create!(
  [
  {customer_id: 1,
  item_id: 5,
  order_id: 1,
  repair_id: nil,
  made_to_order_id: nil,
  price: 674300,
  making_status: "着手不可",
  amount: 1
  },

  {customer_id: 1,
  item_id: 2,
  order_id: 1,
  repair_id: nil,
  made_to_order_id: nil,
  price: 674300,
  making_status: "着手不可",
  amount: 1
  },

  {customer_id: 1,
  item_id: 5,
  order_id: 2,
  repair_id: nil,
  made_to_order_id: nil,
  price: 688600,
  making_status: "着手不可",
  amount: 2
  },

  {customer_id: 1,
  item_id: 13,
  order_id: 3,
  repair_id: nil,
  made_to_order_id: nil,
  price: 40260,
  making_status: "着手不可",
  amount: 1
  },

  {customer_id: 2,
  item_id: 16,
  order_id: 3,
  repair_id: nil,
  made_to_order_id: nil,
  price: 40260,
  making_status: "着手不可",
  amount: 1
  }
  ]
)

Repair.create!(
  [
  {customer_id: 1,
  address: "大阪市西区九条13-257",
  name: "守田 祥真",
  wheelchair_kinds: "リクライニング",
  tire: "",
  break: "",
  caster: "",
  status: "修理依頼中",
  message: nil
  },

  {customer_id: 1,
  address: "大阪市西区九条13-257",
  name: "守田 祥真",
  wheelchair_kinds: "リクライニング",
  tire: "",
  break: "",
  caster: "",
  status: "修理依頼中",
  message: nil
  },

  {customer_id: 1,
  address: "大阪市西区九条13-257",
  name: "守田 祥真",
  wheelchair_kinds: "リクライニング",
  tire: "タイヤとチューブ交換",
  break: "ブレーキの調整",
  caster: "",
  status: "修理依頼中",
  message: nil
  },

  {customer_id: 2,
  address: "東京都港区神園町3-167",
  name: "佐藤 あきら",
  wheelchair_kinds: "リクライニング",
  tire: "タイヤとチューブ交換",
  break: "ブレーキの調整",
  caster: "キャスターの交換",
  status: "修理依頼中",
  message: nil
  }
  ]
)