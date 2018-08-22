class Follower
  attr_reader :username, :image

  def initialize(follower_info)
    @username = follower_info[:login]
    @image = follower_info[:avatar_url]
  end
end
