# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
	
		factory :admin do
			roles ["admin"]
		end
  end

  factory :article do
  	content "Lorem ipsum"
  	user
  end
end