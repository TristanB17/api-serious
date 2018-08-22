class HomeController < ApplicationController
  def index
    if current_user
      @conn = Faraday.new("https://api.github.com") do |faraday|
        faraday.headers['Authorization'] = "token #{current_user.token}"
        faraday.adapter(Faraday.default_adapter)
      end

      response = @conn.get("/users/#{current_user.username}/starred")

      @starred_repos = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
