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
  step "I fill in 'Email' with '#{ @user.email }'"
  step "I fill in 'Password' with '#{ @user.password }'"
  step "I press 'Sign in'"
  step "I should see 'Welcome #{ @user.name }' within 'div.flash'"
end

step "I should be signed in in successfully" do
  # And I should see "user" within "title"
  # And I could go to my profile page
  # And I could go to my settings page
  step "I should see 'Welcome' within 'div.flash'"
  step "I should be able to sign out"
  step "I should not see a link to the 'sign up' page"
  step "I should not see a link to the 'sign in' page"
end


step "I visit my profile page" do
  visit user_path(@user)
end

step "I visit my settings page" do
  visit edit_user_registration_path
end

step "I visit the settings page of this other user" do
  visit edit_user_registration_path(@user2)
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

step "I should be able to sign out" do
  # page.should have_link("sign out", href: signout_path)
  page.should have_link("sign out", href: signout_path, method: :delete)
end
