class VideoWatchingHistory < ApplicationRecord
  belongs_to :user
  belongs_to :video
end
