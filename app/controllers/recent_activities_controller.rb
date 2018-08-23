class RecentActivitiesController < ApplicationController
  def index
    recent = UserSearch.new(current_user)
    @user_recent_activities = recent.return_user_activities
  end
end
