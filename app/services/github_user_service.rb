class GithubUserService
  attr_reader :token, :username

  def initialize(user)
    @user = user
  end

  def call_starred_repos
    @starred ||= get_json("/users/#{@user.username}/starred")
  end

  private
  def conn
    Faraday.new("https://api.github.com") do |faraday|
      faraday.headers['Authorization'] = "token #{@user.token}"
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
