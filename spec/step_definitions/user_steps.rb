step "I am signed in as them" do
	step "I am on the homepage"
	step "I follow 'sign in'"
	step "I fill in 'Email' with '#{@user.email}'"
	step "I fill in 'Password' with '#{@user.password}'"
	step "I press 'Sign in'"
	step "I should see 'Signed in successfully.'"
end

step "there are the following users:" do |table|
  table.hashes.each do |attributes|
  	unconfirmed = attributes.delete("unconfirmed") == "true"
  	admin = attributes.delete("admin")	
  	@user = User.create!(attributes)
  	@user.update_attribute("admin", admin == "true")
  	@user.confirm! unless unconfirmed
  end
end

# step "I am signed in as :email" do |email|
# 	@user = User.find_by_email!(email)
# 	step "I am signed in as them"
# end