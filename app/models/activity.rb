class Activity
  attr_reader :repo, :type, :commit_messages, :time, :url

  def initialize(activity_info)
    @repo = activity_info[:repo][:name]
    @type = activity_info[:type]
    @url = activity_info[:repo][:url]
    @commit_messages = check_for_commits(activity_info)
    @time = DateTime.parse(activity_info[:created_at])
  end

  def check_for_commits(activity)
    if activity[:payload][:commits].nil? == false
      number = 0
      activity[:payload][:commits].map do |commit|
        "#{number += 1}. #{commit[:message]}"
      end.join("\n")
    else
      "N/A"
    end
  end
end
