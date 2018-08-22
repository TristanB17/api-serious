require 'rails_helper'

describe 'a user' do
  context 'visiting /followers' do
    it 'sees a list of all followers of the user' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      click_on 'followers'
      expect(current_path).to eq('/followers')
      expect(page).to have_css('.follower', count: 3)

      within(first('.follower')) do
        expect(page).to have_css('.username')
      end
    end
  end
end
