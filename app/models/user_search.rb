class UserSearch
  def initialize(user)
    @service ||= GithubUserService.new(user)
  end

  def starred_repos
    @service.call_starred_repos.map do |star|
      Repo.new(star)
    end
  end
end
