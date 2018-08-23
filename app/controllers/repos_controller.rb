class ReposController < ApplicationController
  def index
    repos = UserSearch.new(current_user)
    @user_repos = repos.user_repos
  end
end
