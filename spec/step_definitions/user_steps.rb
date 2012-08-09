step "there are the following users:" do |table|
  table.hashes.each do |attributes|
  	unconfirmed = attributes.delete("unconfirmed") == "true"
  	admin = attributes.delete("admin")	
  	@user = User.create!(attributes)
  	@user.update_attribute("admin", admin == "true")
  	@user.confirm! unless unconfirmed
  end
end

step "I am signed in as them" do
	# steps(%Q{
	# 	And I am on the homepage
	# 	When I follow "sign in"
	# 	And I fill in "Email" with "#{ @user.email }"
	# 	And I fill in "Password" with "#{ @user.password }"
	# 	And I press "Sign in"
	# 	Then I should see "Signed in successfully."
	# })
end

step "I am signed in as :email" do |email|
	@user = User.find_by_email!(email)
	steps("Given I am signed in as them")
end