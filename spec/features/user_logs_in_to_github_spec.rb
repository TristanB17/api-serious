require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using omniauth-github' do
    stub_omniauth
    visit root_path

    expect(page).to have_link('Login to Github')
    click_link('Login to Github')

    expect(page).to have_content("Welcome")
    expect(page).to have_content("Tristan")
    expect(page).to have_link("Logout")
  end
end
