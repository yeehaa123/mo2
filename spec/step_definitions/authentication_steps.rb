step "I sign in with provider :prov_name" do |prov_name|
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(prov_name, {
  :uid => '12345',
  info: {
    name: "BlaBla",
    email: "BlaBla@BlaBlaBla.com",
    image: ""
    }
  })
  visit "/auth/#{prov_name.downcase}"
  @user = User.last
	OmniAuth.config.test_mode = false
end

step "I follow the Facebook :link link" do |link|
	OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:facebook, {
  :uid => '12345',
  info: {
    name: "BlaBla",
    email: "BlaBla@BlaBlaBla.com",
    image: ""
    }
  })
	click_link(link) 
	@user = User.last
	OmniAuth.config.test_mode = false
end

step "I should be signed in in successfully" do
  step "I should see 'Welcome' within 'div.flash'"
  step "I should be able to sign out"
  step "I should be able to visit my profile page"
  step "I should be able to visit my settings page"
  step "I should be able to visit the user index"
  step "I should not see a link to the 'sign up' page"
  step "I should not see a link to the 'sign in' page"
end

step "I am an admin" do
  @user.roles = ["admin"]
  @user.save
  OmniAuth.config.test_mode = true
  visit "/auth/#{:identity.downcase}"
  OmniAuth.config.test_mode = true
end