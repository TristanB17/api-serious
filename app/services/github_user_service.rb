class GithubUserService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call_starred_repos
    @starred ||= get_json("/users/#{@user.username}/starred")
  end

  def call_user_repos
    @repos ||= get_json("/users/#{@user.username}/repos")
  end

  def call_followers
    @followers ||= get_json("/users/#{@user.username}/followers")
  end

  def call_followings
    @followings ||= get_json("/users/#{@user.username}/following")
  end

  def call_user_activities
    @user_activities ||= get_json("/users/#{@user.username}/events").take(20)
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
