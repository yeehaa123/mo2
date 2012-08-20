step "I am on the homepage" do
 	visit "/"
end

# Then /^I should( not)? see "([^"]*)"$/ do |negate, message|
# 	negate ? page.should_not(have_content(message)) : page.should(have_content(message))
# end

step "I should see :message" do |message|
	page.should have_content(message)
end

# Then /^I should( not)? see "([^"]*)" within "([^"]*)"$/ do |negate, text, selector|
# 	if negate
# 		page.should_not have_selector selector, text: text
# 	else
# 		page.should have_selector selector, text: text
# 	end 
# end

step "I should see :message within :selector" do |message, selector|
	page.should have_selector selector, text: message
end

step "I should not see :message within :selector" do |message, selector|
	page.should_not have_selector selector, text: message
end


step "I follow :link within :selector" do |link, selector|
with_scope(selector) do
	  click_link(link)
	end
end

step "I follow :link" do |link|
	click_link(link)
end


step "show me the page" do
  save_and_open_page
end

step "I should see a link to the :page_name page" do |page_name|
	page.should have_link(page_name)
end

step "I should not see a link to the :page_name page" do |page_name|
	page.should_not have_link(page_name)
end

step "I should see a link :link_name to :url" do |link_name, url|
	page.should have_link(link_name, href: url)
end

step "I should see a flash :flash_kind" do |flash_kind|
	page.should have_selector("div.flash_#{ flash_kind }")
end

step "I should get a :response_number response" do |response_number|
	assert [response_number.to_i].include?(@integration_session.status), 
		"Expected status to be #{ response_number }, got #{ @integration_session.status }"
end

# step "I am redirected to( the) :url" do |url|
#   assert [301, 302].include?(@integration_session.status), "Expected status to be 301 or 302, got #{@integration_session.status}"
#   location = @integration_session.headers["Location"]
#   assert_equal url, location
#   visit location
# end

step "I am redirected to( the) signin path" do
	response.should redirect_to(signin_path)
end

step "I am redirected to( the) root path" do
	response.should redirect_to(root_path)
end

step "I am redirected to( the) user path" do
	response.should redirect_to(user_path)
end

step "the page should have a :selector" do |selector|
	page.should have_selector(selector)
end