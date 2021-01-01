# == Schema Information
#
# Table name: receipts
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  platform_type :string           not null
#  platform_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :platform, polymorphic: true # as receipt 的 platform
end
