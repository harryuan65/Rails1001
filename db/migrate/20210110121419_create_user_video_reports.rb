class CreateUserVideoReports < ActiveRecord::Migration[6.1]
  def change
    create_view :user_video_reports, materialized: true
  end
end
