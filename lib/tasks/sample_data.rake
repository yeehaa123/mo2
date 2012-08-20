namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		99.times do |n|
			name = Faker::Name.name
			first_name = Faker::Name.name
			last_name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(user_name: name,
									 email: email,
									 first_name: first_name,
									 last_name: last_name)
		end
	end
end