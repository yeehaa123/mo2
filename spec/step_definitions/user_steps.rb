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
  step "I am on the homepage"
  step "I follow 'sign in'"
  step "I fill in 'Email' with '#{@user.email}'"
  step "I fill in 'Password' with '#{@user.password}'"
  step "I press 'Sign in'"
  step "I should see 'Signed in successfully.'"
end

step "I visit my profile page" do
  visit user_path(@user)
end

step "I visit my settings page" do
  visit edit_user_registration_path(@user)
end

step "he visits his settings page" do
  visit edit_user_registration_path(@user)
end

step "I could go to my profile page" do
  page.should have_link("profile", href: user_path(@user))
end

step "I could go to my settings page" do
  page.should have_link("settings", href: edit_user_registration_path(@user))
end

# step "I am signed in as :email" do |email|
# 	@user = User.find_by_email!(email)
# 	step "I am signed in as them"
# end

step "I should see my/his :name within :selector" do |name, selector|
  page.should have_selector selector, text: @user_name
end