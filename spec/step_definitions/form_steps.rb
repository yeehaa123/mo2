step "I fill in :input_field with :name" do |input_field, name|
	fill_in input_field, with: name
end

step "I press :button_name" do |button_name|
		click_button button_name
end