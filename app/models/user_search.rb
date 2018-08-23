class UserSearch
  attr_reader :service

  def initialize(user)
    @service ||= GithubUserService.new(user)
  end

  def starred_repos
    @service.call_starred_repos.map do |star|
      Repo.new(star)
    end
  end

  def user_repos
    @service.call_user_repos.map do |repo|
      Repo.new(repo)
    end
  end

  def return_followers
    @service.call_followers.map do |follower|
      Follower.new(follower)
    end
  end

  def return_followings
    @service.call_followings.map do |follower|
      Follower.new(follower)
    end
  end

  def return_user_activities
    @service.call_user_activities.map do |activity|
      Activity.new(activity)
    end
  end
end
