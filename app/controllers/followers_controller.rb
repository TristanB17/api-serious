class FollowersController < ApplicationController
  def index
    followers = UserSearch.new(current_user)
    @github_followers = followers.return_followers
  end
end
