class VideoWatchingHistoriesController < ApplicationController
  before_action :authenticate_user!
  def my_histories
    @result = UserVideoReport.where(user_id: current_user.id)
    render json: @result
  end
end
