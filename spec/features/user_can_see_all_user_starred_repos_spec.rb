require 'rails_helper'

describe 'a user' do
  context 'visiting /starred_repos' do
    it 'sees the number of starred repos of the user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      stub_request(:get, "https://api.github.com/users/souffle/starred").
        with(
           headers: {
       	  'Accept'=>'application/vnd.github.cloak-preview',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Authorization'=>'token bf5cd7486b2376642d1cb4db44a8b1e12397c65f',
       	  'User-Agent'=>'Faraday v0.12.2'
           }).
        to_return(status: 200, body: File.read('./spec/mock_requests/starred.json'), headers: {})

      click_on 'starred repos'

      expect(current_path).to eq(starred_path)
      expect(page).to have_content('Starred Repos')
      expect(page).to have_content('2')
    end
  end
end
