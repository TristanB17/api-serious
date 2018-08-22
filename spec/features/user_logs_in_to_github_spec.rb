require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using omniauth-github' do
    stub_omniauth
    stub_request(:get, "https://api.github.com/users/souffle/starred").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Authorization'=>'token bf5cd7486b2376642d1cb4db44a8b1e12397c65f',
       	  'User-Agent'=>'Faraday v0.12.2'
           }).
         to_return(status: 200, body: "#{File.read('./spec/mock_requests/starred.json')}", headers: {})

    visit root_path
    expect(page).to have_link('Login to Github')
    click_link('Login to Github')

    expect(page).to have_content("Welcome")
    expect(page).to have_content("boi")
    expect(page).to have_link("Logout")
  end
end
