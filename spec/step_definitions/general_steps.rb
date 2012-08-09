# module WithinHelpers
#   def with_scope(locator)
#     locator ? within(locator) { yield } : yield
#   end
# end
# World(WithinHelpers)

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