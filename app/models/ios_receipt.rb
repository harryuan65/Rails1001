# == Schema Information
#
# Table name: ios_receipts
#
#  id           :integer          not null, primary key
#  product_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class IosReceipt < ApplicationRecord
  has_one :receipt, as: :platform # as receipt 的 platform
end
