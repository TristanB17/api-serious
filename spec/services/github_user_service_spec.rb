require 'rails_helper'

describe 'a user' do
  context 'visiting the following page' do
    it 'sees the folling accounts and their five most recent commits', :vcr do
      user_hash = {:provider => 'github',
                    :uid => '33517218',
                    :info => {
                        :name => 'Tristan',
                      },
                      :credentials => {
                        :token => ENV["TEST_TOKEN"]
                      },
                      :extra => {
                        :raw_info => {
                          :login => 'TristanB17',
                          :avatar_url => 'https://avatars2.githubusercontent.com/u/33517218?v=4'
                          }
                        }
                      }
      user = User.create_with_omniauth(user_hash)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @service = GithubUserService.new(user)
      followings = @service.call_followings


      expect(followings).to be_a(Array)
      expect(followings.first).to be_a(Hash)
    end
  end
end
