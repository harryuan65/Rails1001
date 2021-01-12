class VideoWatchingHistoriesController < ApplicationController
  def my_histories
    @result = UserVideoReport.where(user_id: current_user.id)
    render json: @result
  end
end
