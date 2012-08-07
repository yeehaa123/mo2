module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^I am on the homepage$/ do
	visit root_path
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

When /^(?:|I )follow "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
	with_scope(selector) do
	  click_link(link)
	end
end