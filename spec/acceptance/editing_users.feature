Feature: Editing User Information
	As a signed-in user
	I want to be able to edit my profile

	Background:
		Given a user exists
		And I am signed in as them
	# 	And I visit my settings page

	# Scenario: Entering invalid information
	# 	When I press 'Save changes'
	# 	Then I should see 'error'

	# Scenario: Entering valid information
	# 	When I fill in "Name" with "New Name"
	# 	And I fill in "Email" with "new@example.com"
	# 	And I fill in "Current password" with "please"
	# 	And I press "Save changes"
	# 	Then I should see "New Name" within "title"
	# 	And I should see a flash notice
	# 	And I should be able to sign out

	# 	When "new@example.com" opens the email with subject "Confirmation instructions"
	# 	And they click the first link in the email
	# 	And I should see a flash notice
	# 	Then I should see "Your account was successfully confirmed"