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



# メインのサンプルインフォメーションを作成する
Information.create!(category: "played", content:  "スーパー丸夫")
Information.create!(category: "played", content:  "ファーストファンタジー")
Information.create!(category: "played", content:  "ダブルクエスト")
Information.create!(category: "played", content:  "インドアファイター")
Information.create!(category: "played", content:  "バブルアンドドラゴンズ")
Information.create!(category: "played", content:  "クリーチャーハンター")

# 追加のサンプルインフォメーションを生成
30.times do |n|
  content  = Faker::Game.title
  category = "played"
  Information.create(content:  content, category: category)
end