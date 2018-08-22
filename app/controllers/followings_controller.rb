class FollowingsController < ApplicationController
  def index
    @conn = Faraday.new("https://api.github.com") do |faraday|
      faraday.headers['Authorization'] = "token #{current_user.token}"
      faraday.adapter(Faraday.default_adapter)
    end

    response = @conn.get("/users/#{current_user.username}/following")

    followings = JSON.parse(response.body, symbolize_names: true)

    @github_followings = followings.map do |following|
      Follower.new(following)
    end
  end
end
