# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.build_self_introduction(content: content).save! }
  
# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


# メインのサンプルゲームを作成する
Information.create!(category: "played", content:  "スーパー丸夫")
Information.create!(category: "played", content:  "ファーストファンタジー")
Information.create!(category: "played", content:  "ダブルクエスト")
Information.create!(category: "played", content:  "インドアファイター")
Information.create!(category: "played", content:  "バブルアンドドラゴンズ")
Information.create!(category: "played", content:  "クリーチャーハンター")

# 追加のサンプルゲームを生成
30.times do |n|
  content  = Faker::Game.title
  category = "played"
  Information.create(content:  content, category: category)
end


# メインのサンプルコンソールを作成する
Information.create!(category: "console", content:  "転任動ツイッチ")
Information.create!(category: "console", content:  "SP2")
Information.create!(category: "console", content:  "guindows")
Information.create!(category: "console", content:  "スマートフォン")
Information.create!(category: "console", content:  "Mac")
Information.create!(category: "console", content:  "アナログゲーム")

# 追加のサンプルコンソールを生成
30.times do |n|
  content  = Faker::Name.name
  category = "console"
  Information.create(content:  content, category: category)
end


# メインのサンプルツールを作成する
Information.create!(category: "contact", content:  "Dコード")
Information.create!(category: "contact", content:  "flype")
Information.create!(category: "contact", content:  "ザ・線")
Information.create!(category: "contact", content:  "ゾーム")
Information.create!(category: "contact", content:  "カカポ")
Information.create!(category: "contact", content:  "電話")

# 追加のサンプルツールを生成
30.times do |n|
  content  = Faker::Name.name
  category = "contact"
  Information.create(content:  content, category: category)
end

# ユーザー情報を作成する
users = User.all
user  = users.first
infos = Information.all
info = Information.first
having = users[2..50]
played = infos[1..20]
console = infos[36..41]
contact = infos[72..77]
# 1が,3から20をフォロー
played.each { |had| user.have(had) }
# ３から50が,1をフォロー
having.each { |haver| haver.have(info) }

#1がコンソールとツールをフォロー
console.each { |had| user.have(had) }
contact.each { |had| user.have(had) }
