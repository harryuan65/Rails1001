# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  user = User.new(email: "harry@gmail.com")
  user.password = "123456"
  user.save

  point_record = user.point_records.create!(points: 100)
  UserPointInfo.create!(user: user, points: point_record.points)

  ios_receipt = IosReceipt.create!(product_type: "vip_1m")
  android_receipt = AndroidReceipt.create!(product_type: "vip_1m")

  user.receipts.create!(platform: ios_receipt)
  user.receipts.create!(platform: android_receipt)
  user.pictures.create!(asset: "bfc3ef5a69c8831ce4e7d72be8f32d843ccd05591526ece39c4932ed3f4f")
  article = user.articles.create!(title: "Hello Rails", content: "Why Node? Go Rails!")
  picture = Picture.create!(asset: "bd6292de54ed8a0c3870ba500e21b2ffae4a87e42580479550c6fe797026", imageable: article)
  article.picture = picture
  article.save!

  times = 40.times.map do
    t = rand(10.days).seconds.ago
    [t , t + rand(900.minutes)]
  end.sort_by{|a| a[0]}

  user_ids = User.all.map(&:id)

  times.each do |arr|
    VideoWatchingHistory.create!(user_id: user_ids.sample, video_id: video_ids.sample, start_time: arr[0], created_at: arr[0], end_time: arr[1], updated_at: arr[1])
  end

  times = 40.times.map{ rand(2.day).seconds.ago }.sort
  User.order(id: :asc).each.with_index{|user, i| user.update created_at: times[i]}
end