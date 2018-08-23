class Repo
  attr_reader :name, :owner, :url, :date_created, :most_recently_updated
  
  def initialize(repo_info)
    @name = repo_info[:name]
    @owner = repo_info[:owner][:login]
    @url = repo_info[:url]
    @date_created = Date.parse(repo_info[:created_at])
    @most_recently_updated = Date.parse(repo_info[:updated_at])
  end
end
