When /^I fill in "(.*?)" with "(.*?)"$/ do |input_field, name|
	fill_in input_field, with: name
end

When /^I press "(.*?)"$/ do |button_name|
		click_button button_name
end