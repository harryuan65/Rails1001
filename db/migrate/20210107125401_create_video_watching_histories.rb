class CreateVideoWatchingHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :video_watching_histories do |t|
      t.integer :user_id
      t.integer :video_id
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
