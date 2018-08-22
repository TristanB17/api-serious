FactoryBot.define do
  factory :user do
    provider { "github" }
    uid { "12345" }
    name { "boi" }
    username { "TristanB17" }
    token { ENV["TEST_TOKEN"] }
    image { 'guhguhguhguh.html' }
  end
end
