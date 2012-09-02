namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		99.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(user_name: first_name,
									 email: email,
									 first_name: first_name,
									 last_name: last_name)
		end
		users = 	User.limit(10)
		50.times do
			content = "# #{ Faker::Lorem.sentence(5) }\n #{ Faker::Lorem.sentence(500) }"
			users.each { |user| user.articles.create!(content: content) }
		end
	end
end