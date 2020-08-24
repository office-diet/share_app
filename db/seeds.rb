# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books = [
  "ゼロ秒思考","マンガでわかる 1万円起業",
  "13際からのアート思考","ビジネスマンの父より息子への30通の手紙",
  "精神科は今日も、やりたい放題", "STEREO SOUND ALTEC", 
  "ディープ・ブルーズ","HTML&CSSコーディング・プラクティスブック1",
  "HTML&CSSコーディング・プラクティスブック2","HTML+CSSデザイン",
  "jQuery最高の教科書", "Gibson Les Paul Guide",
  "マインドセット「やればできる！」の研究",
  "ノンデザイナーズ・デザインブック",
  "PHP連想配列集中特訓", "PHPTodoリストを作ろう",
  "確かな力が身につくPHP「超」入門", "PHP入門",
  "Ruby on Rails 5.0初級①", "基礎Ruby on Rails",
  "Searh Inside Yourself", "SHOE DOG",
  "THE TEAM5つの法則", "Think CIVILITY",
  "USJを劇的に変えたたった1つの考え方", "Webプログラミング超入門",
  "ZERO to ONE", "あずきちゃん1",
  "あずきちゃん3", "あずきちゃん4",
  "あずきちゃん5", "イシューからはじめよ",
  "日本人が知らなかったイスラム教", "90分でわかるヴィトゲンシュタイン",
  "おじいちゃん戦争のことを教えて", "こころの処方箋",
  "自分では気づかない、ココロの盲点", "サイコパス",
  "テキヤはどこからやってくるのか？", "「ない仕事」の作り方",
  "HIGH POWER MARKETING", "漫画バビロン大富豪の教え",
  "マンガ始めましてファインマン先生", "ユダヤ5000年の知恵",
  "ローマは一日にして成らず01", "愛情はふる星のごとく",
  "異文化理解力", "遠野物語",
  "奇跡の経済教室【基礎知識編】", "奇跡経済教室【戦略編】",
  "菊と刀", "なぜ世界のお金持ちの35％はユダヤ人なのか？",
  "訓読みの話", "嫌われる勇気",
  "日本人のための憲法原論", "幸せになる勇気",
  "幸福優位7つの法則", "裁判官が日本を滅ぼす",
  "坂田アキラの三角関数・指数・対数", "志高く",
  "自殺直前日記", "核技術・伝える技術",
  "昭和天皇論", "神は妄想である",
  "図形と方程式", "赤線跡を歩く",
  "戦後の貧民", "戦争論",
  "知ってはいけない", "わたし、定時で帰ります。",
  "天才を殺す凡人", "東京の下層社会",
  "日本国紀", "増補版敗北を抱きしめて下",
  "増補版敗北を抱きしめて上", "売り上げを、減らそう",
  "反省させると犯罪者になります", "「超」入門微分積分",
  "人を殺すとはどういうことか", "不可触民と現代インド",
  "人を操る禁断の文章術", "麻雀放浪記1",
  "麻雀放浪記2", "夜と霧",
  "利己的な遺伝子", "恋愛論", "現代語訳論語と算盤"
]

strNum = ""
books.each_with_index do |book, index|
  strNum = "00#{index + 1}"
  strNum = strNum.slice(strNum.length - 3, 3)
  Product.create(name: book, image: "#{strNum}.jpg")
end

87.times do |index|
  id = index + 1
  Item.create(condition_id: 1, text: "テスト", product_id: id)
  Item.create(condition_id: 2, text: "テスト", product_id: id)
  Item.create(condition_id: 3, text: "テスト", product_id: id)
  Item.create(condition_id: 4, text: "テスト", product_id: id)
  Item.create(condition_id: 5, text: "テスト", product_id: id)
  Item.create(condition_id: 6, text: "テスト", product_id: id)
end