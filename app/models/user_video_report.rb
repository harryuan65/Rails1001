# models/user_video_report.rb
class UserVideoReport < ApplicationRecord
  def readonly?
    true
  end
  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
  end
end
