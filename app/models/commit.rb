class Commit
  attr_reader :url, :repo, :commit_message, :time

  def initialize(commit_info)
    @url = commit_info[:url]
    @repo = commit_info[:repository][:name]
    @time = DateTime.parse(commit_info[:commit][:author][:date])
    @commit_message = commit_info[:commit][:message]
  end
end
