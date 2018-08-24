require 'rails_helper'

describe 'a user' do
  context 'visiting /recent_activity' do
    it 'sees a list of recent activities from the user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      stub_request(:get, "https://api.github.com/users/souffle/events").
        with(
           headers: {
       	  'Accept'=>'application/vnd.github.cloak-preview',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Authorization'=>'token bf5cd7486b2376642d1cb4db44a8b1e12397c65f',
       	  'User-Agent'=>'Faraday v0.12.2'
           }).
        to_return(status: 200, body: File.read('./spec/mock_requests/user_recent_activity.json'), headers: {})

      click_on "your recent activity"

      expect(current_path).to eq(recent_activities_path)
      expect(page).to have_content("#{user.name}'s Recent Activity")
      expect(page).to have_content("Repo Affected:")
      expect(page).to have_content('rails_engine')
    end
  end
end
