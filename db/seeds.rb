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
    email: "ss@icloud.com", birth_date: "1960-01-01", post_code: "8764326", address: "大阪市西区九条13-257", telephone_number: "080638247", password: "ss1111"},
    {first_name: "佐藤", last_name: "あきら", kana_first_name: "サトウ", kana_last_name: "アキラ", email: "sato@icloud.com", birth_date: "1965-01-01", post_code: "3542378", address: "東京都港区神園町3-167", telephone_number: "09045612345", password: "sato1111"},
    {first_name: "後藤", last_name: "幸子", kana_first_name: "ゴトウ", kana_last_name: "サチコ", email: "goto@icloud.com", birth_date: "1955-01-01", post_code: "8763798", address: "東京都港区芝浦1-432", telephone_number: "08076512568", password: "goto1111"}
  ]
)

Admin.create!(
  [
    { email: "admin@admin.com", password: "ad1111"},
  ]
)
