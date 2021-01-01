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
end