# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  imageable_type :string           not null
#  imageable_id   :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
