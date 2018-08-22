class FollowingsController < ApplicationController
  def index
    @conn = Faraday.new("https://api.github.com/users") do |faraday|
      faraday.headers['Authorization'] = "token #{current_user.token}"
      faraday.adapter(Faraday.default_adapter)
    end

    response = @conn.get("/#{current_user.username}/following")

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    @followings = parsed_response.map do |following|
      Following.new(following)
    end
  end
end
