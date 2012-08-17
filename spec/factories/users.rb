# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "Facebook"
    uid "blablabla"
    name "Yeehaa"
    email "yeehaa@yeehaa.org"
    image ""
  end
end
