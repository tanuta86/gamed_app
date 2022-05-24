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

User.create!(name:  "ゆん",
             email: "ynpa@icloud.com",
             password:              "aiueo1",
             password_confirmation: "aiueo1",
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "たぬお",
             email: "t.s.a.tahpkar@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)           
             

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)

  users.each { |user| user.build_self_introduction(content: "#{Faker::Creature::Animal.name}が好きです！").save! }
  
# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


# メインのサンプルコンソールを作成する
Information.create!(category: "console", content:  "転任動ツイッチ")
Information.create!(category: "console", content:  "SP2")
Information.create!(category: "console", content:  "guindows")
Information.create!(category: "console", content:  "スマートフォン")
Information.create!(category: "console", content:  "Mac")
Information.create!(category: "console", content:  "アナログゲーム")

# 追加のサンプルコンソールを生成
30.times do |n|
  content  = Faker::Dessert.variety
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
  content  = Faker::Dessert.variety
  category = "contact"
  Information.create(content:  content, category: category)
end

# プレイスタイルを作成する
Information.create!(category: "style", content:  "エンジョイ")
Information.create!(category: "style", content:  "マイペース")
Information.create!(category: "style", content:  "本気")
Information.create!(category: "style", content:  "協調性重視")
Information.create!(category: "style", content:  "暇つぶし")
Information.create!(category: "style", content:  "競技志向")

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

# ユーザー情報を作成する
users = User.all
user  = users.first
infos = Information.all
info = Information.find(79)
info2 = Information.find(1)
info3 = Information.find(37)

having = users[2..50]
played = infos[78..100]
console = infos[1..6]
contact = infos[36..41]

# 1が,3から73から100をフォロー
played.each { |had| user.have(had) }
#1がコンソールとツールをフォロー
console.each { |had| user.have(had) }
contact.each { |had| user.have(had) }

# ３から50が,1,2,3をフォロー
having.each { |haver| haver.have(info) }
having.each { |haver| haver.have(info2) }
having.each { |haver| haver.have(info3) }


# ユーザーの一部を対象にグループを生成する
users = User.order(:created_at).take(6)
3.times do
  name = Faker::Game.title
  users.each { |user| user.groups.create!(name: "#{user.name}の#{name}グループ") }
end


# グループと情報を作成する
groups = Group.all
group  = groups.first
infos = Information.all
info = Information.find(79)
info2 = Information.find(1)
info3 = Information.find(37)

tagging = groups[2..10]
played = infos[78..79]
console = infos[1..6]
contact = infos[36..41]

# 1が,3から73から100をフォロー
played.each { |tagged| group.tag(tagged) }
#1がコンソールとツールをフォロー
console.each { |tagged| group.tag(tagged) }
contact.each { |tagged| group.tag(tagged) }

# 2から10が,1,2,3をフォロー
tagging.each { |tagger| tagger.tag(info) }
tagging.each { |tagger| tagger.tag(info2) }
tagging.each { |tagger| tagger.tag(info3) }

# ユーザーとグループを作成する
users = User.all
user  = users.first
groups = Group.all
group = Group.find(1)
group2 = Group.find(2)
group3 = Group.find(3)

users2 = users[2..10]
groups2 = groups[1..15]


# 1が,1から15をfavorite
groups2.each { |gro| user.favorite(gro) }

# 2から10が,1,2,3をfavorite
users2.each { |user2| user2.favorite(group) }
users2.each { |user2| user2.favorite(group2) }
users2.each { |user2| user2.favorite(group3) }

groups = Group.order(:created_at).take(6)
20.times do
  content = "#{Faker::Game.title}で遊ぼう！"
  groups.each { |group| group.microposts.build(content: content, user_id: User.first.id).save! }
end
