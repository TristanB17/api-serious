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
      Activity.new(activity) if activity[:payload][:commits].present?
    end.compact
  end

  def return_user_organizations
    if @service.call_user_organizations.empty? == false
      @service.call_user_organizations.map do |org|
        Organization.new(org)
      end
    else
      "This user is not currently involved with any organizations"
    end
  end

  def followings_activities(following_username)
    following_activities = @service.call_following_activities(following_username).pop(5).sort_by { |commit| commit[:commit][:author][:date] }.reverse
    following_activities.map { |activity| Commit.new(activity) }
  end

end
