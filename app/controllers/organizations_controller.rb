class OrganizationsController < ApplicationController
  def index
    orgs = UserSearch.new(current_user)
    @user_organizations = orgs.return_user_organizations
    
  end
end
