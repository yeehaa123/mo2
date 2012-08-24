# step "there are the following users:" do |table|
#   table.hashes.each do |attributes|
#   	unconfirmed = attributes.delete("unconfirmed") == "true"
#   	admin = attributes.delete("admin")	
#   	@user = User.create!(attributes)
#   	@user.update_attribute("admin", admin == "true")
#   	@user.confirm! unless unconfirmed
#   end
# end

# step "I am signed in as them" do
#   step "I am on the homepage"
#   step "I follow 'sign in'"
#   step "I fill in 'Email' with '#{ @identity.email }'"
#   step "I fill in 'Password' with '#{ @identity.password }'"
#   step "I press 'Sign in'"
#   step "I should see 'Welcome #{ @identity.name }' within 'div.flash'"
# end

# step "I should be signed in in successfully" do
#   step "I should see 'Welcome' within 'div.flash'"
#   step "I should be able to sign out"  
#   step "I should see a link to the 'profile' page"
#   step "I should see a link to the 'settings' page"
#   step "I should not see a link to the 'sign up' page"
#   step "I should not see a link to the 'sign in' page"
# end

# step "I visit my profile page" do
#   visit user_path(@user)
# end

# # step "I illegally submit to the users path" do
# #   put user_path(@user)
# # end

# # step "I legally submit to the users path" do
# #   cookies[:remember_token] = @user.remember_token
# #   put user_path(@user)
# # end

# # step "I illegally submit to the other users path" do
# #   cookies[:remember_token] = @user.remember_token
# #   put user_path(@user2)
# # end

# # step "I am signed in as :email" do |email|
# # 	@user = User.find_by_email!(email)
# # 	step "I am signed in as them"
# # end