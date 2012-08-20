# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
  end
end