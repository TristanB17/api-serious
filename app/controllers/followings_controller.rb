class FollowingsController < ApplicationController
  def index
    @github_followings = UserSearch.new(current_user)
  end
end
