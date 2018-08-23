class FollowingsController < ApplicationController
  def index
    followings = UserSearch.new(current_user)
    @github_followings = followings.return_followings
  end
end
