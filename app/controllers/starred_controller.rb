class StarredController < ApplicationController
  def index
    starred = UserSearch.new(current_user)
    @starred_repos = starred.starred_repos
  end
end
