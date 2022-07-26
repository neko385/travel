# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン用
  Admin.create!(
    email: 'admin@email.com',
    password: 'testtest',
  )

  # テストデータ
  customers = Customer.create!(
    [
      {screen_name: 'sample', last_name: 'サンプル', first_name: '太郎', last_kana: 'サンプル',first_kana: 'タロウ',email: 'sample@mail',password: 'samplesample'},
      {screen_name: 'test', last_name: 'テスト', first_name: '太郎', last_kana: 'テスト', first_kana: 'タロウ', email: 'test@mail', password: 'testtarou'},
      {screen_name: 'いちご', last_name: '苺', first_name: '太郎', last_kana: 'イチゴ', first_kana: 'タロウ', email: 'itigo@mail', password: 'itigoitigo'},
      {screen_name: 'もも', last_name: '桃', first_name: '太郎', last_kana: 'モモ', first_kana: 'タロウ', email: 'momo@mail', password: 'momomomo'},
      {screen_name: 'かき', last_name: '柿', first_name: '太郎', last_kana: 'カキ', first_kana: 'タロウ', email: 'kaki@mail', password: 'kakikaki'}
    ]
  )

  travel_memories = TravelMemory.create!(
    [
      {place: '北海道札幌市', introduction: '札幌市です。北海道の県庁所在地です', latitude: '43.06417', longitude: '141.34694', customer_id: customers[1].id},
      {place: '青森県青森市', introduction: '青森市です。青森県の県庁所在地です', latitude: '40.82444', longitude: '140.74', customer_id: customers[2].id},
      {place: '岩手県盛岡市', introduction: '盛岡市です。岩手県の県庁所在地です', latitude: '39.70361', longitude: '141.1525', customer_id: customers[3].id},
      {place: '宮城県仙台市', introduction: '仙台市です。宮城県の県庁所在地です', latitude: '38.26889', longitude: '140.87194', customer_id: customers[4].id},
      {place: '秋田県秋田市', introduction: '秋田市です。秋田県の県庁所在地です', latitude: '39.71861', longitude: '140.1025', customer_id: customers[0].id},
      {place: '山形県山形市', introduction: '山形市です。山形県の県庁所在地です', latitude: '38.24056', longitude: '140.36333', customer_id: customers[1].id},
      {place: '福島県福島市', introduction: '福島市です。福島県の県庁所在地です', latitude: '37.75', longitude: '140.46778', customer_id: customers[2].id},
      {place: '茨城県水戸市', introduction: '盛岡市です。岩手県の県庁所在地です', latitude: '39.70361', longitude: '141.1525', customer_id: customers[3].id},
      {place: '栃木県宇都宮市', introduction: '宇都宮市です。栃木県の県庁所在地です', latitude: '36.56583', longitude: '139.88361', customer_id: customers[4].id},
      {place: '群馬県前橋市', introduction: '前橋市です。群馬県の県庁所在地です', latitude: '36.39111', longitude: '139.06083', customer_id: customers[0].id},
      {place: '埼玉県さいたま市', introduction: 'さいたま市です。埼玉県の県庁所在地です', latitude: '35.85694', longitude: '139.64889', customer_id: customers[1].id},
      {place: '千葉県千葉市', introduction: '千葉市です。千葉県の県庁所在地です', latitude: '35.60472', longitude: '140.12333', customer_id: customers[2].id},
      {place: '東京都新宿区', introduction: '新宿区です。東京都の県庁所在地です', latitude: '35.68944', longitude: '139.69167', customer_id: customers[3].id},
      {place: '神奈川県横浜市', introduction: '横浜市です。神奈川県の県庁所在地です', latitude: '35.44778', longitude: '139.6425', customer_id: customers[4].id},
      {place: '新潟県新潟市', introduction: '新潟市です。新潟県の県庁所在地です', latitude: '37.90222', longitude: '139.02361', customer_id: customers[0].id},
      {place: '富山県富山市', introduction: '富山市です。富山県の県庁所在地です', latitude: '36.69528', longitude: '137.21139', customer_id: customers[1].id},
      {place: '石川県金沢市', introduction: '金沢市です。石川県の県庁所在地です', latitude: '36.59444', longitude: '136.62556', customer_id: customers[2].id},
      {place: '福井県福井市', introduction: '福井市です。福井県の県庁所在地です', latitude: '36.06528', longitude: '136.22194', customer_id: customers[3].id},
      {place: '山梨県甲府市', introduction: '甲府市です。山梨県の県庁所在地です', latitude: '35.66389', longitude: '138.56833', customer_id: customers[4].id},
      {place: '長野県長野市', introduction: '長野市です。長野県の県庁所在地です', latitude: '36.65139', longitude: '138.18111', customer_id: customers[0].id},
      {place: '岐阜県岐阜市', introduction: '岐阜市です。岐阜県の県庁所在地です', latitude: '35.39111', longitude: '136.72222', customer_id: customers[1].id},
      {place: '静岡県静岡市', introduction: '静岡市です。静岡県の県庁所在地です', latitude: '34.97694', longitude: '138.38306', customer_id: customers[2].id},
      {place: '愛知県名古屋市', introduction: '名古屋市です。愛知県の県庁所在地です', latitude: '35.18028', longitude: '136.90667', customer_id: customers[3].id},
      {place: '三重県津市', introduction: '津市です。三重県の県庁所在地です', latitude: '34.73028', longitude: '136.50861', customer_id: customers[4].id},
      {place: '滋賀県大津市', introduction: '大津市です。滋賀県の県庁所在地です', latitude: '35.00444', longitude: '135.86833', customer_id: customers[0].id},
      {place: '京都府京都市', introduction: '京都市です。京都府の県庁所在地です', latitude: '35.02139', longitude: '135.75556', customer_id: customers[1].id},
      {place: '大阪府大阪市', introduction: '大阪市です。大阪府の県庁所在地です', latitude: '34.68639', longitude: '135.52', customer_id: customers[2].id},
      {place: '兵庫県神戸市', introduction: '神戸市です。兵庫県の県庁所在地です', latitude: '34.69139', longitude: '135.18306', customer_id: customers[3].id},
      {place: '奈良県奈良市', introduction: '奈良市です。奈良県の県庁所在地です', latitude: '34.68528', longitude: '135.83278', customer_id: customers[4].id},
      {place: '和歌山県和歌山市', introduction: '和歌山市です。和歌山県の県庁所在地です', latitude: '34.22611', longitude: '135.1675', customer_id: customers[0].id},
      {place: '鳥取県鳥取市', introduction: '鳥取市です。鳥取県の県庁所在地です', latitude: '35.50361', longitude: '134.23833', customer_id: customers[1].id},
      {place: '島根県松江市', introduction: '松江市です。島根県の県庁所在地です', latitude: '35.47222', longitude: '133.05056', customer_id: customers[2].id},
      {place: '岡山県岡山市', introduction: '岡山市です。岡山県の県庁所在地です', latitude: '34.66167', longitude: '133.935', customer_id: customers[3].id},
      {place: '広島県広島市', introduction: '広島市です。広島県の県庁所在地です', latitude: '34.39639', longitude: '132.45944', customer_id: customers[4].id},
      {place: '山口県山口市', introduction: '山口市です。山口県の県庁所在地です', latitude: '34.18583', longitude: '131.47139', customer_id: customers[0].id},
      {place: '徳島県徳島市', introduction: '徳島市です。徳島県の県庁所在地です', latitude: '34.06583', longitude: '134.55944', customer_id: customers[1].id},
      {place: '香川県高松市', introduction: '高松市です。香川県の県庁所在地です', latitude: '34.34028', longitude: '134.04333', customer_id: customers[2].id},
      {place: '愛媛県松山市', introduction: '松山市です。愛媛県の県庁所在地です', latitude: '33.84167', longitude: '132.76611', customer_id: customers[3].id},
      {place: '高知県高知市', introduction: '高知市です。高知県の県庁所在地です', latitude: '33.55972', longitude: '133.53111', customer_id: customers[4].id},
      {place: '福岡県福岡市', introduction: '福岡市です。福岡県の県庁所在地です', latitude: '33.60639', longitude: '130.41806', customer_id: customers[0].id},
      {place: '佐賀県佐賀市', introduction: '佐賀市です。佐賀県の県庁所在地です', latitude: '33.24944', longitude: '130.29889', customer_id: customers[1].id},
      {place: '長崎県長崎市', introduction: '長崎市です。長崎県の県庁所在地です', latitude: '32.74472', longitude: '129.87361', customer_id: customers[2].id},
      {place: '熊本県熊本市', introduction: '熊本市です。熊本県の県庁所在地です', latitude: '32.78972', longitude: '130.74167', customer_id: customers[3].id},
      {place: '大分県大分市', introduction: '大分市です。大分県の県庁所在地です', latitude: '33.23806', longitude: '131.6125', customer_id: customers[4].id},
      {place: '宮崎県宮崎市', introduction: '宮崎市です。宮崎県の県庁所在地です', latitude: '31.91111', longitude: '131.42389', customer_id: customers[0].id},
      {place: '鹿児島県鹿児島市', introduction: '鹿児島市です。鹿児島県の県庁所在地です', latitude: '31.56028', longitude: '130.55806', customer_id: customers[1].id},
      {place: '沖縄県那覇市', introduction: '那覇市です。沖縄県の県庁所在地です', latitude: '26.2125', longitude: '127.68111', customer_id: customers[2].id}
    ]
  )