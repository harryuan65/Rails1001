# == Schema Information
#
# Table name: android_receipts
#
#  id           :integer          not null, primary key
#  product_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class AndroidReceipt < ApplicationRecord
end
