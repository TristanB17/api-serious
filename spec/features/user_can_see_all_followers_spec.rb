require 'rails_helper'

describe 'a user' do
  context 'visiting /followers' do
    it 'sees a list of all followers of the user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      stub_request(:get, "https://api.github.com/users/souffle/starred").
           with(
             headers: {
         	  'Accept'=>'*/*',
         	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         	  'Authorization'=>'token bf5cd7486b2376642d1cb4db44a8b1e12397c65f',
         	  'User-Agent'=>'Faraday v0.12.2'
             }).
           to_return(status: 200, body: "#{File.read('./spec/mock_requests/starred.json')}", headers: {})

      visit '/'

      stub_request(:get, "https://api.github.com/users/souffle/followers").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'token bf5cd7486b2376642d1cb4db44a8b1e12397c65f',
          'User-Agent'=>'Faraday v0.12.2'
          }).
          to_return(status: 200, body: "#{File.read('./spec/mock_requests/followers.json')}", headers: {})

      click_on 'followers'

      expect(current_path).to eq('/followers')
      expect(page).to have_css('.follower', count: 3)

      within(first('.follower')) do
        expect(page).to have_css('.username')
      end
    end
  end
end
