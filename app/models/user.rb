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
  has_many :android_receipts, through: :receipts, source: :platform, source_type: 'AndroidReceipt'
  has_many :ios_receipts, through: :receipts, source: :platform, source_type: 'IosReceipt'
  has_many :pictures, as: :imageable
  has_many :articles
  has_one :last_article, ->{select("distinct on (user_id) *").order("user_id desc, created_at desc")}, class_name: "Article"
  enum role: {normal: 0, admin: 1}
  def self.country_codes
    ["TW", "RU", "US", "JP", "HK", "CN"]
  end
  # has_many :ios_receipts, through: :join_association, source: :source_association_name, foreign_key: :key_name, source_type: :actual_association_model_type
end
