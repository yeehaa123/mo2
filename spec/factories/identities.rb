# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    name "Yeehaa"
    email "yeehaa@yeehaa.haa"
    password_digest "please"
  end
end
