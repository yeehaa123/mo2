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
  step "I fill in 'Email' with '#{ @identity.email }'"
  step "I fill in 'Password' with '#{ @identity.password }'"
  step "I press 'Sign in'"
  step "I should see 'Welcome #{ @identity.name }' within 'div.flash'"
end

step "I should be signed in in successfully" do
  step "I should see 'Welcome' within 'div.flash'"
  step "I should be able to sign out"  
  step "I should see a link to the 'profile' page"
  step "I should see a link to the 'settings' page"
  step "I should not see a link to the 'sign up' page"
  step "I should not see a link to the 'sign in' page"
end

step "I visit my profile page" do
  visit user_path(@user)
end

step "I visit the user index" do
  visit users_path
end

step "I visit the sign up page" do
  visit new_identity_path
end

step "I visit my settings page" do
  visit edit_user_path(@user)
end

step "I visit his/her settings page" do
  visit edit_user_path(@user2)
end

# step "I illegally submit to the users path" do
#   put user_path(@user)
# end

# step "I legally submit to the users path" do
#   cookies[:remember_token] = @user.remember_token
#   put user_path(@user)
# end

# step "I illegally submit to the other users path" do
#   cookies[:remember_token] = @user.remember_token
#   put user_path(@user2)
# end

step "I should be able to visit my profile page" do
  page.should have_link("profile", href: user_path(@user))
end

step "I should be able to visit my settings page" do
  page.should have_link("settings", href: edit_user_path(@user))
end

step "I should be able to visit the user index" do
  page.should have_link("users", href: users_path)
end

step "sign up should not create a user" do
  expect { click_button "Sign up" }.not_to change(User, :count)
end

step "sign up should create a user" do
  expect { click_button "Sign up" }.to change(User, :count)
end

# step "I am signed in as :email" do |email|
# 	@user = User.find_by_email!(email)
# 	step "I am signed in as them"
# end

step "I should see my/his :name within :selector" do |name, selector|
  page.should have_selector selector, text: @identity.name
end

step "I should be able to sign out" do
  # page.should have_link("sign out", href: signout_path)
  page.should have_link("sign out", href: signout_path, method: :delete)
end

step "my user_name should be updated in the database to :new_value" do |new_value|
  @user.reload.user_name.should == new_value
end

step "my email should be updated in the database to :new_value" do |new_value|
  @user.reload.email.should == new_value
end

step "it should list each user" do
  User.all.page(1).each do |user|
    page.should have_selector('li', text: user.user_name)
  end
end