# == Schema Information
#
# Table name: user_point_infos
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  points     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserPointInfo < ApplicationRecord
  belongs_to :user
end
