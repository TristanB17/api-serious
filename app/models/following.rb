class Following
  attr_reader :username, :image

  def initialize(following_info)
    @username = following_info[:username]
    @image = following_info[:avatar_url]
  end
end
