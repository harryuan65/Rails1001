# == Schema Information
#
# Table name: point_records
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  points     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PointRecord < ApplicationRecord
  belongs_to :user
end
