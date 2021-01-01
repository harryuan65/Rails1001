# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  picture_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_point_info
  has_many :point_records
  has_many :receipts
  has_many :android_receipts, through: :receipts, source: 'platform_id'
  has_many :ios_receipts, through: :receipts, source: 'platform_id'
  has_many :pictures, as: :imageable
  has_many :articles
  # has_many :ios_receipts, through: :join_association, source: :join_association_table_foreign_key_to_ios_receipts_table
end
