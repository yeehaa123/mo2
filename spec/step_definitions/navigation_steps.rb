step "I am on the homepage" do
 	visit root_path
end

step "I follow :link" do |link|
 	click_link(link)
end

step "I follow :link within :selector" do |link, selector|
with_scope(selector) do
	  click_link(link)
	end
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

step "I visit the user index" do
  visit users_path
end

step "I should be able to visit my profile page" do
  page.should have_link("profile", href: user_path(@user))
end

step "I should be able to visit my settings page" do
  page.should have_link("settings", href: edit_user_path(@user))
end

step "I should be able to visit the user index" do
  page.should have_link("users", href: users_path)
end

step "I should be able to sign out" do
  page.should have_link("sign out", href: signout_path, method: :delete)
end
