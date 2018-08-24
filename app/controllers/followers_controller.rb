class FollowersController < ApplicationController
  def index
    followers = UserSearch.new(current_user)
    @github_followers = followers.return_followers
  end

  def show
    follower = UserSearch.new(current_user)
    @github_follower = follower.followings_activities(params[:follower])
  end
end
