FactoryBot.define do
  factory :user do
    provider { "github" }
    uid { "12345" }
    name { "boi" }
    username { "souffle" }
    token { ENV["TEST_TOKEN"] }
    image { 'guhguhguhguh.html' }
  end
end
