Given /^I am on the homepage$/ do
	visit('/static_pages/home')
end

Then /^I should( not)? see "([^"]*)"$/ do |negate, message|
	negate ? page.should_not(have_content(message)) : page.should(have_content(message))
end

Then /^I should( not)? see "([^"]*)" within "([^"]*)"$/ do |negate, text, selector|
	if negate
		page.should_not have_selector selector, text: text
	else
		page.should have_selector selector, text: text
	end 
end