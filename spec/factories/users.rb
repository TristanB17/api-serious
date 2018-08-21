FactoryBot.define do
  factory :user do
    provider "github"
    uid "12345"
    name "boi"
  end
end
