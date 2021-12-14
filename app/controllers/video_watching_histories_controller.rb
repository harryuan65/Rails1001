class VideoWatchingHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:my_histories]

  def index
    @video_watching_histories = VideoWatchingHistory.limit(50)
    render json: @video_watching_histories
  end

  def summary
    @summary = VideoWatchingHistory
               .select('video_id, videos.name, sum(end_time - start_time) as time_used')
               .joins(:video)
               .where(user_id: current_user.id)
               .group('1, 2')
               .order('3')
    render json: @summary
  end

  def summary2
    @summary = UserVideoReport.where(user_id: current_user.id)
    render json: @summary
  end

  def current_user
    Struct.new(:id).new(9017)
  end
end
